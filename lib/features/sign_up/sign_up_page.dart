import 'package:financas/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:financas/common/constants/app_colors.dart';
import 'package:financas/common/constants/app_text_styles.dart';
import 'package:financas/widgets/custom_text_button.dart';
import 'package:financas/widgets/primary_button.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lavender,
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.10,
          ),
          Text('Comece a controlar',
              textAlign: TextAlign.center,
              style: AppTextStyles.mediumText
                  .copyWith(color: AppColors.greenLightTwo)),
          Text('Seus Gastos',
              textAlign: TextAlign.center,
              style: AppTextStyles.mediumText
                  .copyWith(color: AppColors.greenLightTwo)),
          Image.asset('assets/images/signUp.png'),
          const Form(
              child: Column(
            children: [
              CustomFormField(
                labelText: "Seu Usuario",
                hintText: "email@email.com",
              ),
            ],
          )),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.height * 0.032,
              vertical: MediaQuery.of(context).size.height * 0.016,
            ),
            child: PrimaryButton(
              text: 'Cadastrar',
              onPressed: () {},
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
                  color: AppColors.greenLightOne,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
