import 'package:financas/common/constants/app_colors.dart';
import 'package:financas/common/constants/app_text_styles.dart';
import 'package:financas/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              height: 600,
              color: AppColors.lavender,
              child: Image.asset(
                'assets/images/main.png',
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 600,
              color: AppColors.white,
              child: Column(children: [
                const SizedBox(
                  height: 50.0,
                ),
                Text('Economize mais',
                    style: AppTextStyles.mediumText
                        .copyWith(color: AppColors.greenLightTwo)),
                Text('Gaste com inteligência',
                    style: AppTextStyles.mediumText
                        .copyWith(color: AppColors.greenLightTwo)),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: PrimaryButton(
                    text: 'Entrar',
                    onPressed: () {},
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Não tem conta?',
                        style: AppTextStyles.smallText
                            .copyWith(color: AppColors.grayLight)),
                    Text('Cadastre-se',
                        style: AppTextStyles.smallText
                            .copyWith(color: AppColors.greenLightTwo)),
                  ],
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
