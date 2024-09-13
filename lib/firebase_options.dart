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
    apiKey: 'AIzaSyC7NE3KXw91Xaq5HgqJLdGUyD9gkn5FQds',
    appId: '1:856921230878:web:645d79e697acb4157d280f',
    messagingSenderId: '856921230878',
    projectId: 'makeup-store-8f73e',
    authDomain: 'makeup-store-8f73e.firebaseapp.com',
    storageBucket: 'makeup-store-8f73e.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAsDVNkyU0rFyylrcPtWr7dUyvmEPRLqgY',
    appId: '1:856921230878:android:05b566ee1e156b997d280f',
    messagingSenderId: '856921230878',
    projectId: 'makeup-store-8f73e',
    storageBucket: 'makeup-store-8f73e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBaIs49z0fc_4dXLSghXbw1aSrYTjilnuE',
    appId: '1:856921230878:ios:7e121ab2a7c9cda37d280f',
    messagingSenderId: '856921230878',
    projectId: 'makeup-store-8f73e',
    storageBucket: 'makeup-store-8f73e.appspot.com',
    iosBundleId: 'com.example.simpleFlutterWebsite',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBaIs49z0fc_4dXLSghXbw1aSrYTjilnuE',
    appId: '1:856921230878:ios:7e121ab2a7c9cda37d280f',
    messagingSenderId: '856921230878',
    projectId: 'makeup-store-8f73e',
    storageBucket: 'makeup-store-8f73e.appspot.com',
    iosBundleId: 'com.example.simpleFlutterWebsite',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC7NE3KXw91Xaq5HgqJLdGUyD9gkn5FQds',
    appId: '1:856921230878:web:e61b0ca1dc64a4487d280f',
    messagingSenderId: '856921230878',
    projectId: 'makeup-store-8f73e',
    authDomain: 'makeup-store-8f73e.firebaseapp.com',
    storageBucket: 'makeup-store-8f73e.appspot.com',
  );
}
