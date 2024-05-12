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
    apiKey: 'AIzaSyDPpJDOid5qAvJ8narRHuXT874xgTz5hEs',
    appId: '1:1054752586712:web:6d68de4d27e549ed7090ad',
    messagingSenderId: '1054752586712',
    projectId: 'to-do-list-b2cd0',
    authDomain: 'to-do-list-b2cd0.firebaseapp.com',
    storageBucket: 'to-do-list-b2cd0.appspot.com',
    measurementId: 'G-XQD2SP3D4C',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCVu7SfPAydxk_9xt1QXUrHmmd4z9qTAOg',
    appId: '1:1054752586712:android:4fa4f8a48fe5973c7090ad',
    messagingSenderId: '1054752586712',
    projectId: 'to-do-list-b2cd0',
    storageBucket: 'to-do-list-b2cd0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAcPp7BkmOwVz0wJcQbzatOMGn813WFWd4',
    appId: '1:1054752586712:ios:43c8c7fdade937147090ad',
    messagingSenderId: '1054752586712',
    projectId: 'to-do-list-b2cd0',
    storageBucket: 'to-do-list-b2cd0.appspot.com',
    iosBundleId: 'com.example.toDoList',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAcPp7BkmOwVz0wJcQbzatOMGn813WFWd4',
    appId: '1:1054752586712:ios:43c8c7fdade937147090ad',
    messagingSenderId: '1054752586712',
    projectId: 'to-do-list-b2cd0',
    storageBucket: 'to-do-list-b2cd0.appspot.com',
    iosBundleId: 'com.example.toDoList',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDPpJDOid5qAvJ8narRHuXT874xgTz5hEs',
    appId: '1:1054752586712:web:84219c040760bfb77090ad',
    messagingSenderId: '1054752586712',
    projectId: 'to-do-list-b2cd0',
    authDomain: 'to-do-list-b2cd0.firebaseapp.com',
    storageBucket: 'to-do-list-b2cd0.appspot.com',
    measurementId: 'G-JCC4Z7PZFV',
  );
}
