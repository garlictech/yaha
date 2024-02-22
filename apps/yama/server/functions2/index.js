const functions = require('firebase-functions');
const stripe = require('stripe')(functions.config().stripe.testkey);

const generateResponse = intent => {
  switch (intent.status) {
    case 'requires_action':
      return {
        clientSecret: intent.clientSecrtet,
        requiresAction: true,
        status: intent.status,
      };
    case 'requires_payment_method':
      return {
        error: 'Your card was denied, please provide a new payment method',
      };
    case 'succeeded':
      console.log('Payment succeeded');
      return {
        clientSecret: intent.clientSecrtet,
        status: intent.status,
      };
    default:
      return { error: 'Failed' };
  }
};

exports.StripePayendpointMethodId = functions.https.onRequest(
  async (request, response) => {
    functions.logger.info('StripePayendpointMethodId', {
      structuredData: true,
    });
    const { paymentMethodId, currency, useStripeSdk } = request.body;
    const amount = 600;

    try {
      if (paymentMethodId) {
        const params = {
          amount,
          confirm: true,
          confirmation_method: 'manual',
          currency,
          payment_method: paymentMethodId,
          use_stripe_sdk: useStripeSdk,
        };

        const intent = await stripe.paymentIntents.create(params);
        console.log(`Intent: ${intent}`);
        return response.send(generateResponse(intent));
      }

      return response.sendStatus(400);
    } catch (e) {
      return response.send({ error: e.message });
    }
  },
);

exports.StripePayendpointIntentId = functions.https.onRequest(
  async (request, response) => {
    functions.logger.info('StripePayendpointIntentId', {
      structuredData: true,
    });

    const { paymentIntentId } = request.body;

    try {
      if (paymentIntentId) {
        const intent = await stripe.paymentIntents.confirm(paymentIntentId);
        return response.send(generateResponse(intent));
      }

      return response.sendStatus(400);
    } catch (e) {
      return response.send({ error: e.message });
    }
  },
);
