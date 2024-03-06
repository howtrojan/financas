import 'package:financas/common/constants/app_colors.dart';
import 'package:financas/common/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const PrimaryButton({
    super.key,
    this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      child: Ink(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            gradient: LinearGradient(colors: [
              AppColors.greenLightOne,
              AppColors.greenLightTwo,
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          onTap: onPressed,
          child: Container(
            alignment: Alignment.center,
            height: 64,
            child: Text(
              text,
              style: AppTextStyles.buttonText.copyWith(color: AppColors.white),
            ),
          ),
        ),
      ),
    );
  }
}
