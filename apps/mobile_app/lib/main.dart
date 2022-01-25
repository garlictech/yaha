import 'package:flutter/material.dart';
import 'package:yaha/hike/views/screens/poi-screen.dart';
import 'package:yaha/profile/profile-page.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaha/views/auth/screens/signup-screen.dart';
import 'package:yaha/views/track/screens/tracking.dart';
import 'profile/events/views/screens/event-detail-screen.dart';
import 'settings/views/settings-screen.dart';
//import 'package:amplify_flutter/amplify_flutter.dart';
//import 'package:amplify_datastore/amplify_datastore.dart';
//import 'amplifyconfiguration.dart';

import 'bottom-nav-bar.dart';
import 'explore.dart';
import 'hike/hike-screen/hike-screen.dart';

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
        '/event': (context) => EventDetailScreen(),
        '/poi': (context) => PoiScreen(),
        '/settings': (context) => SettingsScreen(),
        '/signup': (context) => SignupScreen(),
        '/track': (context) => TrackingScreen(),
        '/explore': (context) => ExplorePage(),
      },
    );
  }
}
