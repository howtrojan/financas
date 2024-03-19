import 'package:financas/app.dart';
import 'package:financas/firebase_options.dart';
import 'package:financas/locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupDependecies();
  runApp(const App());
}
