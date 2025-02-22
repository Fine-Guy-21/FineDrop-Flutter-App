// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDeRGTV1v-nX893zzVrg-R0pp1dHNJkRCw',
    appId: '1:962602656344:android:3ca9b14cb67b00be54a02d',
    messagingSenderId: '962602656344',
    projectId: 'finedrop-7b79a',
    storageBucket: 'finedrop-7b79a.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDPaMelttfEnYY_4cvswoJo4u2GXhsEOAM',
    appId: '1:962602656344:ios:b1fc990e897380cb54a02d',
    messagingSenderId: '962602656344',
    projectId: 'finedrop-7b79a',
    storageBucket: 'finedrop-7b79a.firebasestorage.app',
    iosBundleId: 'com.example.finedrop',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBGbVnlm-9qOvrUExJdh2M1KaRJs0Ub9Dk',
    appId: '1:962602656344:web:9649f76ff6f2cd9e54a02d',
    messagingSenderId: '962602656344',
    projectId: 'finedrop-7b79a',
    authDomain: 'finedrop-7b79a.firebaseapp.com',
    storageBucket: 'finedrop-7b79a.firebasestorage.app',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBGbVnlm-9qOvrUExJdh2M1KaRJs0Ub9Dk',
    appId: '1:962602656344:web:e10e8f8f0dffe22654a02d',
    messagingSenderId: '962602656344',
    projectId: 'finedrop-7b79a',
    authDomain: 'finedrop-7b79a.firebaseapp.com',
    storageBucket: 'finedrop-7b79a.firebasestorage.app',
  );
}
