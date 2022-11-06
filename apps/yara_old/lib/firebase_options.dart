// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB_VeejLdQq900ERlsHVWuZpiLMb23EQrc',
    appId: '1:613858852311:web:36cab80d1fc48553e49f92',
    messagingSenderId: '613858852311',
    projectId: 'yet-another-projects',
    authDomain: 'yet-another-projects.firebaseapp.com',
    storageBucket: 'yet-another-projects.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD2x93Mfvz8GfB9CkG1DWIYIq9EXLebEHw',
    appId: '1:613858852311:android:74513a6f9b6b7520e49f92',
    messagingSenderId: '613858852311',
    projectId: 'yet-another-projects',
    storageBucket: 'yet-another-projects.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCZB1HYkbFErOcXAOiQ59YSlbSi9F_2v0s',
    appId: '1:613858852311:ios:cfde16611ae8dccde49f92',
    messagingSenderId: '613858852311',
    projectId: 'yet-another-projects',
    storageBucket: 'yet-another-projects.appspot.com',
    iosClientId: '613858852311-jaamhh8kk65h8h1vg12avch8s7a6vhob.apps.googleusercontent.com',
    iosBundleId: 'com.garlictech.yara.yara',
  );
}
