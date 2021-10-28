import 'package:flutter/material.dart';
import 'package:yaha/poi-page.dart';
import 'package:yaha/profile/profile-page.dart';
import 'package:yaha/track-page.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'auth/views/screens/signup-screen.dart';
import 'profile/events/event-detail-page.dart';
import 'settings/views/settings-screen.dart';

import 'bottom-nav-bar.dart';
import 'explore.dart';
import 'hike/hike-screen/hike-screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return MaterialApp(
      title: 'Jaha',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: YahaColors.primary,
          focusColor: YahaColors.primary,
          scaffoldBackgroundColor: YahaColors.background,
          fontFamily: 'Inter'),
      home: BottomNavBar(),
      initialRoute: '/',
      routes: {
        '/hike': (context) => HikeScreen(),
        '/profile': (context) => ProfilePage(),
        '/event': (context) => EventDetailPage(),
        '/poi': (context) => PoiPage(),
        '/settings': (context) => SettingsScreen(),
        '/signup': (context) => SignupScreen(),
        '/track': (context) => TrackPage(),
        '/explore': (context) => ExplorePage(),
      },
    );
  }
}
