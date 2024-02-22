import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_apple/firebase_ui_oauth_apple.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:garlic_revenuecat_purchase/garlic_revenuecat_purchase.dart';
import 'package:yama_motivate/data/auth/logged_in_state.dart';
import 'package:yama_motivate/data/services/revenuecat/revenuecat_config.dart';
import 'package:yama_motivate/domain/usecases/notification_controller.dart';
import 'package:yama_motivate/l10n/app_localizations.dart';
import 'package:yama_motivate/presentation/screens/start_screen.dart';
import 'domain/usecases/notifications.dart';
import 'firebase_options.dart';
import 'package:get_it/get_it.dart';

import ".env.dart";

import 'presentation/screens/home_screen.dart';
import 'presentation/theme.dart';

GetIt getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseUIAuth.configureProviders([
    AppleProvider(),
    GoogleProvider(clientId: DefaultFirebaseOptions.ios.iosClientId ?? ''),
  ]);
  Stripe.publishableKey = stripePublishableKey;
  Stripe.merchantIdentifier = "merchant.com.garlictech.6days";
  await Stripe.instance.applySettings();
  await initializeNotifications();

  // Start configuring RevenueCat
  final revenuecatConfig = createRevenuecatConfig();
  GetIt.I.registerSingleton<RevenuecatConfig>(revenuecatConfig);
  await configureRevenuecat();
  // End configuring RevenueCat

  // Set up navigatorkey for context-less dialogs
  GetIt.I.registerLazySingleton<GlobalKey<NavigatorState>>(
      () => GlobalKey<NavigatorState>());

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoggedIn = ref.watch(loggedInStateProvider);
    ref.watch(notificationControllerProvider);

    return MaterialApp(
      title: 'yaMa Motivate',
      navigatorKey: getIt<GlobalKey<NavigatorState>>(),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
      ],
      theme: theme,
      home: isLoggedIn ? const HomeScreen() : const StartScreen(),
    );
  }
}
