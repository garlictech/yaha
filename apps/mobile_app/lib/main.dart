import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_apple/firebase_ui_oauth_apple.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/config.dart';
import 'package:yaha/data/auth/logged_in_state.dart';
import 'package:yaha/ui/views/screens/main_screen.dart';
import 'package:yaha/ui/views/shared/widgets/yaha-colors.dart';

import 'firebase_options.dart';
import 'ui/views/auth/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseUIAuth.configureProviders([
    EmailAuthProvider(),
    AppleProvider(),
    GoogleProvider(clientId: googleClientId),
  ]);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    final isLoggedIn = ref.watch(loggedInStateProvider);
    return MaterialApp(
      title: 'Yaha',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: YahaColors.primary,
          focusColor: YahaColors.primary,
          scaffoldBackgroundColor: YahaColors.background,
          fontFamily: 'Inter'),
      home: MainScreen(),
      initialRoute: isLoggedIn ? "/" : "/login",
      routes: {'/login': (context) => const LoginScreen()},
    );
  }
}
