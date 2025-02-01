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
        return macos;
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAp8EUaaRp4uFnUb3xwUqMpLuTsQ-6Cgbs',
    appId: '1:88548018902:web:2e931ee8fc4f0ef0309777',
    messagingSenderId: '88548018902',
    projectId: 'mynotes-8fae6',
    authDomain: 'mynotes-8fae6.firebaseapp.com',
    storageBucket: 'mynotes-8fae6.firebasestorage.app',
    measurementId: 'G-MMF5F4EFZE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCYG3C2Rq7ewYNiCh5TCkAHc-tyVUqxKzg',
    appId: '1:310174965333:android:4f73dc76f50010a7acbedc',
    messagingSenderId: '310174965333',
    projectId: 'mynotes-flutter-project-25',
    storageBucket: 'mynotes-flutter-project-25.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBCMC1bFcd4R6wwUqumntYxOk_zDR5jd4s',
    appId: '1:310174965333:ios:72b7634b5e8c426aacbedc',
    messagingSenderId: '310174965333',
    projectId: 'mynotes-flutter-project-25',
    storageBucket: 'mynotes-flutter-project-25.firebasestorage.app',
    iosBundleId: 'com.making.mynotes',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA4YLAcsdzyStQjTeiQxq_uN1KYW8sta4I',
    appId: '1:88548018902:ios:679e629eba421516309777',
    messagingSenderId: '88548018902',
    projectId: 'mynotes-8fae6',
    storageBucket: 'mynotes-8fae6.firebasestorage.app',
    iosBundleId: 'com.making.mynotes',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAp8EUaaRp4uFnUb3xwUqMpLuTsQ-6Cgbs',
    appId: '1:88548018902:web:b775962a507359f0309777',
    messagingSenderId: '88548018902',
    projectId: 'mynotes-8fae6',
    authDomain: 'mynotes-8fae6.firebaseapp.com',
    storageBucket: 'mynotes-8fae6.firebasestorage.app',
    measurementId: 'G-2MV94VBE1X',
  );

}