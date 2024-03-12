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
      borderRadius: BorderRadius.all(
          Radius.circular(MediaQuery.of(context).size.height * 0.030)),
      child: Ink(
        height: MediaQuery.of(context).size.height * 0.050,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
                Radius.circular(MediaQuery.of(context).size.height * 0.030)),
            gradient: const LinearGradient(colors: [
              AppColors.primary,
              AppColors.secundary,
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: InkWell(
          borderRadius: BorderRadius.all(
              Radius.circular(MediaQuery.of(context).size.height * 0.030)),
          onTap: onPressed,
          child: Align(
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
