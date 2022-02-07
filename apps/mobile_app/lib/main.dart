import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:yaha/hike/views/screens/poi-screen.dart';
import 'package:yaha/profile/profile-page.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaha/views/auth/screens/signup-screen.dart';
import 'package:yaha/views/track/screens/tracking.dart';
import 'profile/events/views/screens/event-detail-screen.dart';
import 'settings/views/settings-screen.dart';
import 'bottom-nav-bar.dart';
import 'explore.dart';
import 'hike/hike-screen/hike-screen.dart';
import 'models/ModelProvider.dart';
import 'amplifyconfiguration.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

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
      home: const BottomNavBar(),
      initialRoute: '/',
      routes: {
        '/hike': (context) => HikeScreen(),
        '/profile': (context) => ProfilePage(),
        '/event': (context) => EventDetailScreen(),
        '/poi': (context) => PoiScreen(),
        '/settings': (context) => SettingsScreen(),
        '/signup': (context) => SignupScreen(),
        '/track': (context) => const TrackingScreen(),
        '/explore': (context) => ExplorePage(),
      },
    );
  }

  void _configureAmplify() async {
    // Add the following lines to your app initialization to add the DataStore plugin
    AmplifyDataStore datastorePlugin =
        AmplifyDataStore(modelProvider: ModelProvider.instance);
    try {
      await Amplify.addPlugins(
          [datastorePlugin, AmplifyAPI(), AmplifyAuthCognito()]);
      await Amplify.configure(amplifyconfig);
      await Amplify.DataStore.clear();
      await Amplify.DataStore.start();
      debugPrint("Amplify config done");
    } on AmplifyAlreadyConfiguredException {
      debugPrint(
          "Tried to reconfigure Amplify; this can occur when your app restarts on Android.");
    }
  }
}
