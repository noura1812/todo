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
    apiKey: 'AIzaSyCQHKMnMV7p1K-nGBfhKqzAlgLn4RJk30A',
    appId: '1:24008447020:web:9a5165cdb508598c436d89',
    messagingSenderId: '24008447020',
    projectId: 'todo-app-97797',
    authDomain: 'todo-app-97797.firebaseapp.com',
    storageBucket: 'todo-app-97797.appspot.com',
    measurementId: 'G-LGJKLN0PRN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC1hWvMy_cGos5Q6w6JahQynnhlIn0eD_M',
    appId: '1:24008447020:android:54b3ce41c2e2f6a6436d89',
    messagingSenderId: '24008447020',
    projectId: 'todo-app-97797',
    storageBucket: 'todo-app-97797.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDf_xEtMpiFanoPZfrv9RQclnaPHMPHtro',
    appId: '1:24008447020:ios:72ec7f3b9a81f1b9436d89',
    messagingSenderId: '24008447020',
    projectId: 'todo-app-97797',
    storageBucket: 'todo-app-97797.appspot.com',
    iosClientId: '24008447020-i28eoot03pujkgi7upa1ec830r5i1uqv.apps.googleusercontent.com',
    iosBundleId: 'com.example.todo',
  );
}
