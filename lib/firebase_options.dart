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
    apiKey: 'AIzaSyD8KemQfQpaI0oRroYwAVI6QGY_ocqN0hE',
    appId: '1:947294624005:web:4d3ecb19a341e0d3507f6c',
    messagingSenderId: '947294624005',
    projectId: 'chat-app-c6f43',
    authDomain: 'chat-app-c6f43.firebaseapp.com',
    storageBucket: 'chat-app-c6f43.appspot.com',
    measurementId: 'G-G415K60XF2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAMQzVGSVGicbutqRkQecTbobVdxSBxYec',
    appId: '1:947294624005:android:32cc55deb75f9266507f6c',
    messagingSenderId: '947294624005',
    projectId: 'chat-app-c6f43',
    storageBucket: 'chat-app-c6f43.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCahz88Qa_d0jCSkTDGypCzahSl9lYKraM',
    appId: '1:947294624005:ios:126640b1f2c8de1e507f6c',
    messagingSenderId: '947294624005',
    projectId: 'chat-app-c6f43',
    storageBucket: 'chat-app-c6f43.appspot.com',
    iosBundleId: 'com.example.chat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCahz88Qa_d0jCSkTDGypCzahSl9lYKraM',
    appId: '1:947294624005:ios:126640b1f2c8de1e507f6c',
    messagingSenderId: '947294624005',
    projectId: 'chat-app-c6f43',
    storageBucket: 'chat-app-c6f43.appspot.com',
    iosBundleId: 'com.example.chat',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD8KemQfQpaI0oRroYwAVI6QGY_ocqN0hE',
    appId: '1:947294624005:web:d2487d5939ac7455507f6c',
    messagingSenderId: '947294624005',
    projectId: 'chat-app-c6f43',
    authDomain: 'chat-app-c6f43.firebaseapp.com',
    storageBucket: 'chat-app-c6f43.appspot.com',
    measurementId: 'G-3QSGYPCXWM',
  );

}