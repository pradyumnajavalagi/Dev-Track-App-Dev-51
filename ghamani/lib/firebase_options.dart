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
    apiKey: 'AIzaSyCcpItFDQ0fYUUkUwUHP9PHWQUzg8FSSvs',
    appId: '1:505223182432:web:38bf3cc72a4087792b2b05',
    messagingSenderId: '505223182432',
    projectId: 'finaltodo-d9dd6',
    authDomain: 'finaltodo-d9dd6.firebaseapp.com',
    storageBucket: 'finaltodo-d9dd6.appspot.com',
    measurementId: 'G-XPTRFH8XSZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA4fhvgEkMp-i_xgB8-gSkIJtiCBz6uxkY',
    appId: '1:505223182432:android:7f1bb1a993b19c5d2b2b05',
    messagingSenderId: '505223182432',
    projectId: 'finaltodo-d9dd6',
    storageBucket: 'finaltodo-d9dd6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC5nwrWRsBcg7_KuacYQhjWFrZnjVgxXr0',
    appId: '1:505223182432:ios:6b00468907fe52912b2b05',
    messagingSenderId: '505223182432',
    projectId: 'finaltodo-d9dd6',
    storageBucket: 'finaltodo-d9dd6.appspot.com',
    iosBundleId: 'com.example.flutterTodoApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC5nwrWRsBcg7_KuacYQhjWFrZnjVgxXr0',
    appId: '1:505223182432:ios:6b00468907fe52912b2b05',
    messagingSenderId: '505223182432',
    projectId: 'finaltodo-d9dd6',
    storageBucket: 'finaltodo-d9dd6.appspot.com',
    iosBundleId: 'com.example.flutterTodoApp',
  );
}
