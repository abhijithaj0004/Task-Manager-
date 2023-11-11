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
    apiKey: 'AIzaSyCJWYgD7oFeS9o6jCyh_enGvc2_LjckEQI',
    appId: '1:122796396357:web:97025cfc4901bf8f81b82c',
    messagingSenderId: '122796396357',
    projectId: 'task-manager-max2d',
    authDomain: 'task-manager-max2d.firebaseapp.com',
    storageBucket: 'task-manager-max2d.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCZF8TFXLaTupKr45M4Hh82j6lK_-mEGDM',
    appId: '1:122796396357:android:aea30b317f24010581b82c',
    messagingSenderId: '122796396357',
    projectId: 'task-manager-max2d',
    storageBucket: 'task-manager-max2d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBjuEKj5xsP5F7-gEaa_WjVTrw6bZY6g90',
    appId: '1:122796396357:ios:bed119c63b58b60e81b82c',
    messagingSenderId: '122796396357',
    projectId: 'task-manager-max2d',
    storageBucket: 'task-manager-max2d.appspot.com',
    iosBundleId: 'com.example.taskmanager',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBjuEKj5xsP5F7-gEaa_WjVTrw6bZY6g90',
    appId: '1:122796396357:ios:602e69336ba49efa81b82c',
    messagingSenderId: '122796396357',
    projectId: 'task-manager-max2d',
    storageBucket: 'task-manager-max2d.appspot.com',
    iosBundleId: 'com.example.taskmanager.RunnerTests',
  );
}
