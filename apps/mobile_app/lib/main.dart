import 'package:flutter/material.dart';
import 'package:yaha/bottom-nav-bar.dart';
import 'package:yaha/poi-page.dart';
import 'package:yaha/profile-page.dart';
import 'package:yaha/settings-page.dart';
import 'package:yaha/sign-up-page.dart';
import 'package:yaha/track-page.dart';
import 'package:yaha/yaha-colors.dart';
import 'event-detail-page.dart';
import 'explore-page.dart';
import 'hike-page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jaha',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: YahaColors.primary,
          scaffoldBackgroundColor: YahaColors.background,
          fontFamily: 'Inter'),
      home: BottomNavBar(),
      initialRoute: '/',
      routes: {
        '/hike': (context) => HikePage(),
        '/profile': (context) => ProfilePage(),
        '/event': (context) => EventDetailPage(),
        '/poi': (context) => PoiPage(),
        '/settings': (context) => SettingsPage(),
        '/signup': (context) => SignUpPage(),
        '/track': (context) => TrackPage(),
        '/explore': (context) => ExplorePage(),
      },
    );
  }
}
