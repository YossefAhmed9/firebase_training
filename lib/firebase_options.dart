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
        return macos;
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
    apiKey: 'AIzaSyD5PM5FUGOdd4_uhgSCfV1Y38wSFeb2OB8',
    appId: '1:202318784640:web:b990177cdfb6db55519e65',
    messagingSenderId: '202318784640',
    projectId: 'fir-19f99',
    authDomain: 'fir-19f99.firebaseapp.com',
    storageBucket: 'fir-19f99.appspot.com',
    measurementId: 'G-HJHXQCJ89G',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDW5iGUrLCeuBAf2acQIbJktgTIuBDWROs',
    appId: '1:202318784640:android:9f5c8ee68d3bac4b519e65',
    messagingSenderId: '202318784640',
    projectId: 'fir-19f99',
    storageBucket: 'fir-19f99.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC8KoqrXOvmcG0VkO0U34RXFsX9nHf9RrY',
    appId: '1:202318784640:ios:5332bd43525b5bc6519e65',
    messagingSenderId: '202318784640',
    projectId: 'fir-19f99',
    storageBucket: 'fir-19f99.appspot.com',
    iosBundleId: 'com.example.firebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC8KoqrXOvmcG0VkO0U34RXFsX9nHf9RrY',
    appId: '1:202318784640:ios:19f043d06242bb50519e65',
    messagingSenderId: '202318784640',
    projectId: 'fir-19f99',
    storageBucket: 'fir-19f99.appspot.com',
    iosBundleId: 'com.example.firebase.RunnerTests',
  );
}