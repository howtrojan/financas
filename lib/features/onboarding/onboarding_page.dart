// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:financas/common/constants/routes.dart';
import 'package:financas/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:financas/common/constants/app_colors.dart';
import 'package:financas/common/constants/app_text_styles.dart';
import 'package:financas/widgets/primary_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lavender,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/main.png',
            ),
            Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.4,
              color: AppColors.white,
              child: Column(children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Text('Economize mais',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.mediumText
                        .copyWith(color: AppColors.secundary)),
                Text('Gaste com inteligência',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.mediumText
                        .copyWith(color: AppColors.primary)),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.height * 0.032,
                    vertical: MediaQuery.of(context).size.height * 0.016,
                  ),
                  child: PrimaryButton(
                    text: 'Iniciar',
                    onPressed: () {
                      Navigator.pushNamed(context, NamedRoute.signUp);
                    },
                  ),
                ),
                CustomTextButton(
                  onPressed: () => {},
                  children: [
                    Text(
                      'Não tem conta?',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.smallText.copyWith(
                        color: AppColors.darkGrey,
                      ),
                    ),
                    Text(
                      'Cadastre-se',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.smallText.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
