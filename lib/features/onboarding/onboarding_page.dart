import 'dart:math';

import 'package:financas/common/constants/app_colors.dart';
import 'package:financas/common/constants/app_text_styles.dart';
import 'package:financas/widgets/primary_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lavender,
      body: Column(
        children: [
          Padding(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.height * 0.05)),
          Expanded(
            flex: 2,
            child: Image.asset(
              'assets/images/main.png',
            ),
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              color: AppColors.white,
              child: Column(children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Text('Economize mais',
                    style: AppTextStyles.mediumText
                        .copyWith(color: AppColors.greenLightTwo)),
                Text('Gaste com inteligência',
                    style: AppTextStyles.mediumText
                        .copyWith(color: AppColors.greenLightTwo)),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.height * 0.032,
                    vertical: MediaQuery.of(context).size.height * 0.016,
                  ),
                  child: PrimaryButton(
                    text: 'Entrar',
                    onPressed: () {},
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                        text: TextSpan(
                      children: [
                        TextSpan(
                            text: 'Não tem conta?',
                            style: AppTextStyles.smallText
                                .copyWith(color: AppColors.grayLight)),
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => {},
                            text: 'Cadastre-se',
                            style: AppTextStyles.smallText
                                .copyWith(color: AppColors.greenLightTwo)),
                      ],
                    )),
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
