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
    apiKey: 'AIzaSyCsDiM-mXTV_9f0Q0MfmXupjg7U6jedS94',
    appId: '1:30941603816:web:af7463f894ae1d3ce7a65d',
    messagingSenderId: '30941603816',
    projectId: 'reachout-97e8a',
    authDomain: 'reachout-97e8a.firebaseapp.com',
    storageBucket: 'reachout-97e8a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA0oyFH6cb-oK1PQ5-_yGaa4STnJunOc5w',
    appId: '1:30941603816:android:b171f926f2b55c4ce7a65d',
    messagingSenderId: '30941603816',
    projectId: 'reachout-97e8a',
    storageBucket: 'reachout-97e8a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAcFASOTfDwWU14bIqLKDvoc6hfLUYpj_0',
    appId: '1:30941603816:ios:6ab67c1c99c5487ee7a65d',
    messagingSenderId: '30941603816',
    projectId: 'reachout-97e8a',
    storageBucket: 'reachout-97e8a.appspot.com',
    iosBundleId: 'com.example.reachout2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAcFASOTfDwWU14bIqLKDvoc6hfLUYpj_0',
    appId: '1:30941603816:ios:8e8c2587a30f90aee7a65d',
    messagingSenderId: '30941603816',
    projectId: 'reachout-97e8a',
    storageBucket: 'reachout-97e8a.appspot.com',
    iosBundleId: 'com.example.reachout2.RunnerTests',
  );
}
