import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primary = Color(0xFF483D8B);
  static const Color secundary = Color(0xFF6959CD);
  static const Color white = Color(0xFFFFFFFF);
  static const Color lavender = Color(0xffE6E6FA);
  static const Color darkGrey = Color(0xff444444);
  static const Color gray = Color(0xFF666666);
  static const Color notification = Color.fromARGB(255, 253, 165, 2);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [AppColors.primary, AppColors.secundary],
  );
}
