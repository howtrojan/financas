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
    apiKey: 'AIzaSyBzpZ2_Px4GbpmW4oQAxzORa4uHG5yrKnc',
    appId: '1:699751994296:web:cf9c57113316f61a4a754d',
    messagingSenderId: '699751994296',
    projectId: 'financas-app-4def3',
    authDomain: 'financas-app-4def3.firebaseapp.com',
    storageBucket: 'financas-app-4def3.appspot.com',
    measurementId: 'G-L1T7Y6Z57X',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB0ZnwLHYBEQ--rbvXeg6X9mmMKEfoSNPk',
    appId: '1:699751994296:android:5e8a0023c060bc3d4a754d',
    messagingSenderId: '699751994296',
    projectId: 'financas-app-4def3',
    storageBucket: 'financas-app-4def3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB8TZtg7SNZKqBQrQ0MTxX9ViNrzEDw3CI',
    appId: '1:699751994296:ios:c07d0f475ecb2e3b4a754d',
    messagingSenderId: '699751994296',
    projectId: 'financas-app-4def3',
    storageBucket: 'financas-app-4def3.appspot.com',
    iosBundleId: 'dev.total.financas.financas',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB8TZtg7SNZKqBQrQ0MTxX9ViNrzEDw3CI',
    appId: '1:699751994296:ios:700fc2ed3d4a9cd74a754d',
    messagingSenderId: '699751994296',
    projectId: 'financas-app-4def3',
    storageBucket: 'financas-app-4def3.appspot.com',
    iosBundleId: 'dev.total.financas.financas.RunnerTests',
  );
}
