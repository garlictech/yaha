import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/ui/views/auth/screens/signup-screen.dart';
import 'package:yaha/ui/views/hikes/events/screens/event-detail-screen.dart';
import 'package:yaha/ui/views/hikes/personal/screen/profile-page.dart';
import 'package:yaha/ui/views/hikes/personal/screen/settings-screen.dart';
import 'package:yaha/ui/views/shared/widgets/yaha-colors.dart';
import 'package:yaha/ui/views/hikes/track/screens/tracking.dart';
import 'amplifyconfiguration.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

import 'ui/views/shared/widgets/bottom-nav-bar-widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization();
  runApp(const ProviderScope(child: MyApp()));
}

initialization() async {
  // Add the following lines to your app initialization to add the DataStore plugin
  try {
    await Amplify.addPlugins([AmplifyAuthCognito()]);
    await Amplify.configure(amplifyconfig);
    debugPrint("Amplify config done");
  } on AmplifyAlreadyConfiguredException {
    debugPrint(
        "Tried to reconfigure Amplify; this can occur when your app restarts on Android.");
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yaha',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: YahaColors.primary,
          focusColor: YahaColors.primary,
          scaffoldBackgroundColor: YahaColors.background,
          fontFamily: 'Inter'),
      home: BottomNavBarWidget(),
      initialRoute: '/',
      routes: {
        '/profile': (context) => const ProfilePage(),
        '/event': (context) => const EventDetailScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/signup': (context) => const SignupScreen(),
        '/track': (context) => const TrackingScreen(),
      },
    );
  }
}
