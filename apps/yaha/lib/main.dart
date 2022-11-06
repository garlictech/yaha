import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/ui/views/auth/screens/signup-screen.dart';
import 'package:yaha/ui/views/hikes/events/screens/event-detail-screen.dart';
import 'package:yaha/ui/views/hikes/personal/screen/profile-page.dart';
import 'package:yaha/ui/views/hikes/personal/screen/settings-screen.dart';
import 'package:yaha/ui/views/hikes/track/screens/tracking.dart';

import 'ui/views/shared/shared.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
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
        fontFamily: 'Inter',
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline2: TextStyle(
            fontSize: YahaFontSizes.medium,
            fontWeight: FontWeight.bold,
            color: YahaColors.textColor,
          ),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText1:
              TextStyle(fontSize: YahaFontSizes.small),
          bodyText2:
              TextStyle(fontSize: YahaFontSizes.xxSmall),
        ),
      ),
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
