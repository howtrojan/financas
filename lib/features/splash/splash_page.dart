import 'dart:async';

import 'package:financas/common/constants/app_colors.dart';
import 'package:financas/common/constants/app_text_styles.dart';
import 'package:financas/common/constants/routes.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Timer init() {
    return Timer(const Duration(seconds: 2), navigatoToOnboarding);
  }

  void navigatoToOnboarding() {
    Navigator.pushReplacementNamed(context, NamedRoute.initial);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.primary, AppColors.secundary])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Finanças',
              style: AppTextStyles.bigText.copyWith(color: AppColors.white),
            ),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
