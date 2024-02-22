/**
 * Import function triggers from their respective submodules:
 *
 * import {onCall} from "firebase-functions/v2/https";
 * import {onDocumentWritten} from "firebase-functions/v2/firestore";
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

import { HttpsError, onCall } from 'firebase-functions/v2/https';
import { onSchedule } from 'firebase-functions/v2/scheduler';
import * as logger from 'firebase-functions/logger';
import Stripe from 'stripe';
import * as admin from 'firebase-admin';

// Start writing functions
// https://firebase.google.com/docs/functions/typescript

admin.initializeApp({
  databaseURL:
    'https://yama-motivate-app-default-rtdb.europe-west1.firebasedatabase.app',
});

const db = admin.database();

const stripeCustomerIdKey = 'stripe_customer_id';

export const yamaStripePaymentSheet = onCall(async request => {
  logger.info('Start executing', request);
  const secretKey = process.env.STRIPE_SECRET_KEY || '';

  const userId = request.auth?.uid;

  if (!userId) {
    throw new HttpsError(
      'failed-precondition',
      'The function must be ' + 'called while authenticated.',
    );
  }

  let customerId: string | undefined = await db
    .ref(`users/${userId}/${stripeCustomerIdKey}`)
    .get()
    .then(snapshot => snapshot.val());

  const stripe = new Stripe(secretKey, {
    apiVersion: '2022-11-15',
    typescript: true,
  });

  logger.debug('Customer ID ', customerId);

  if (!customerId) {
    const email = request.data.email;

    if (!email) {
      throw new HttpsError('failed-precondition', 'Missing email');
    }

    const result = await stripe.customers.create({ email });

    customerId = result?.id;
    logger.info('Customer creation result: ', result);

    if (!customerId) {
      throw new HttpsError(
        'internal',
        'Unknown Stripe customer creation error',
      );
    }

    const ref = db.ref(`users/${userId}`);
    await ref.update({
      [stripeCustomerIdKey]: customerId,
    });

    logger.info('Customer ID written into database');
  }

  const ephemeralKey = await stripe.ephemeralKeys.create(
    { customer: customerId },
    { apiVersion: '2022-08-01' },
  );
  const paymentIntent = await stripe.paymentIntents.create({
    amount: 600,
    currency: 'usd',
    customer: customerId,
    shipping: {
      name: 'Jane Doe',
      address: {
        state: 'Texas',
        city: 'Houston',
        line1: '1459  Circle Drive',
        postal_code: '77063',
        country: 'US',
      },
    },
    // Note: some payment methods have different requirements: https://stripe.com/docs/payments/payment-methods/integration-options
    payment_method_types: ['card'],
    capture_method: 'manual',
  });

  return {
    paymentId: paymentIntent.id,
    paymentIntent: paymentIntent.client_secret,
    ephemeralKey: ephemeralKey.secret,
    customer: customerId,
  };
});

export const yamaGoalAchieved = onCall(async request => {
  logger.info('Start executing', request);
  const userId = request.auth?.uid;

  if (!userId) {
    throw new HttpsError(
      'failed-precondition',
      'The function must be ' + 'called while authenticated.',
    );
  }

  const goalId = request.data.goal_id;
  if (!goalId) {
    throw new HttpsError('failed-precondition', 'Missing goalId');
  }

  const secretKey = process.env.STRIPE_SECRET_KEY || '';

  const paymentId: string | undefined = await db
    .ref(`users/${userId}/goals/${goalId}/paymentId`)
    .get()
    .then(snapshot => snapshot.val());

  logger.debug('payment id: ', paymentId);

  if (!paymentId) {
    throw new HttpsError('unknown', 'Missing Stripe payment ID');
  }

  const stripe = new Stripe(secretKey, {
    apiVersion: '2022-11-15',
    typescript: true,
  });

  await stripe.paymentIntents.cancel(paymentId, {
    cancellation_reason: 'requested_by_customer',
  });

  await db.ref(`users/${userId}/goals/${goalId}/status`).set('achieved');
});

export const yamaGoalFailed = onCall(async request => {
  logger.info('Start executing', request);
  const userId = request.auth?.uid;

  if (!userId) {
    throw new HttpsError(
      'failed-precondition',
      'The function must be ' + 'called while authenticated.',
    );
  }

  const goalId = request.data.goal_id;
  if (!goalId) {
    throw new HttpsError('failed-precondition', 'Missing goalId');
  }

  const secretKey = process.env.STRIPE_SECRET_KEY || '';

  const paymentId: string | undefined = await db
    .ref(`users/${userId}/goals/${goalId}/paymentId`)
    .get()
    .then(snapshot => snapshot.val());

  logger.debug('payment id: ', paymentId);

  if (!paymentId) {
    throw new HttpsError('unknown', 'Missing Stripe payment ID');
  }

  const stripe = new Stripe(secretKey, {
    apiVersion: '2022-11-15',
    typescript: true,
  });

  await stripe.paymentIntents.capture(paymentId);

  await db.ref(`users/${userId}/goals/${goalId}/status`).set('failed');
});

export const yamaCaptureAbandonedPayments = onSchedule(
  'every day 00:00',
  async () => {
    logger.info('Start executing');

    /*const secretKey = process.env.STRIPE_SECRET_KEY || "";
  
    const stripe = new Stripe(secretKey, {
      apiVersion: "2022-11-15",
      typescript: true,
    });
  
    await stripe.paymentIntents.search();*/
  },
);
