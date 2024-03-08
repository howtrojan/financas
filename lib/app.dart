import 'package:financas/common/themes/default_theme.dart';
import 'package:financas/features/sign_up/sign_up_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const SignUpPage(), theme: defaultTheme);
  }
}
