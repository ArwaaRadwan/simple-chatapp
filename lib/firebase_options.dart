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
    apiKey: 'AIzaSyB9Gsx1Qi2fmh-4S5O6Qil-Qkdu0MBd3sI',
    appId: '1:968950041625:web:8117f86fcc546ef6afae88',
    messagingSenderId: '968950041625',
    projectId: 'chat-app-ee54a',
    authDomain: 'chat-app-ee54a.firebaseapp.com',
    storageBucket: 'chat-app-ee54a.appspot.com',
    measurementId: 'G-019TDVEN96',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC4h-GOZHEltxssrmf3-A59c6VeVqQURcE',
    appId: '1:968950041625:android:b5ca27b0f5ecf5d4afae88',
    messagingSenderId: '968950041625',
    projectId: 'chat-app-ee54a',
    storageBucket: 'chat-app-ee54a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCUe0V5yEjggnKFvPHgOV3_XeP-ry5ILJ4',
    appId: '1:968950041625:ios:2901c71d21af9075afae88',
    messagingSenderId: '968950041625',
    projectId: 'chat-app-ee54a',
    storageBucket: 'chat-app-ee54a.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCUe0V5yEjggnKFvPHgOV3_XeP-ry5ILJ4',
    appId: '1:968950041625:ios:7ef9ddb0119391d2afae88',
    messagingSenderId: '968950041625',
    projectId: 'chat-app-ee54a',
    storageBucket: 'chat-app-ee54a.appspot.com',
    iosBundleId: 'com.example.chatApp.RunnerTests',
  );
}
