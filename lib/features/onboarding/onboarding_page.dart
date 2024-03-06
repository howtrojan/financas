import 'package:financas/common/constants/app_colors.dart';
import 'package:financas/common/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Entrar',
                      style: AppTextStyles.smallText
                          .copyWith(color: AppColors.white),
                    )),
                const SizedBox(
                  height: 20.0,
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