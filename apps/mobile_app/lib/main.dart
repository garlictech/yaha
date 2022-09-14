import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/ui/views/auth/screens/signup-screen.dart';
import 'package:yaha/ui/views/hikes/events/screens/event-detail-screen.dart';
import 'package:yaha/ui/views/hikes/personal/screen/profile-page.dart';
import 'package:yaha/ui/views/hikes/personal/screen/settings-screen.dart';
import 'package:yaha/ui/views/shared/widgets/yaha-colors.dart';
import 'package:yaha/ui/views/hikes/track/screens/tracking.dart';

import 'ui/views/shared/widgets/bottom-nav-bar-widget.dart';

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
