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
    apiKey: 'AIzaSyD8NOcd0KV6Ksq80N550bZNCD9PQqtEIEU',
    appId: '1:110221890663:web:b1f9f495bfb90a59da30c2',
    messagingSenderId: '110221890663',
    projectId: 'hackfest-gdsc',
    authDomain: 'hackfest-gdsc.firebaseapp.com',
    storageBucket: 'hackfest-gdsc.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCp5KLLAfvGNzOti8t-0pmTUe54IqEuPyM',
    appId: '1:110221890663:android:5321df70f23be759da30c2',
    messagingSenderId: '110221890663',
    projectId: 'hackfest-gdsc',
    storageBucket: 'hackfest-gdsc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAyMRiwdVdUATxnbah-dGnDxhVPWOiSqQc',
    appId: '1:110221890663:ios:ce21890d742cd068da30c2',
    messagingSenderId: '110221890663',
    projectId: 'hackfest-gdsc',
    storageBucket: 'hackfest-gdsc.appspot.com',
    iosClientId: '110221890663-bgv62gqbmd616gkkvfjid5rb4vap0jic.apps.googleusercontent.com',
    iosBundleId: 'com.example.gdscProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAyMRiwdVdUATxnbah-dGnDxhVPWOiSqQc',
    appId: '1:110221890663:ios:ce21890d742cd068da30c2',
    messagingSenderId: '110221890663',
    projectId: 'hackfest-gdsc',
    storageBucket: 'hackfest-gdsc.appspot.com',
    iosClientId: '110221890663-bgv62gqbmd616gkkvfjid5rb4vap0jic.apps.googleusercontent.com',
    iosBundleId: 'com.example.gdscProject',
  );
}
