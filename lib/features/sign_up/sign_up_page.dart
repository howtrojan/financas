import 'dart:math';

import 'package:financas/common/utils/utils.dart';
import 'package:financas/widgets/custom_text_form_field.dart';
import 'package:financas/widgets/password_form_field.dart';
import 'package:flutter/material.dart';
import 'package:financas/common/constants/app_colors.dart';
import 'package:financas/common/constants/app_text_styles.dart';
import 'package:financas/widgets/custom_text_button.dart';
import 'package:financas/widgets/primary_button.dart';
import 'package:financas/common/utils/uppercase_text_formatter.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

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
              style:
                  AppTextStyles.mediumText.copyWith(color: AppColors.primary)),
          Text('seus gastos',
              textAlign: TextAlign.center,
              style: AppTextStyles.mediumText
                  .copyWith(color: AppColors.secundary)),
          Image.asset('assets/images/signUp.png'),
          Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomFormField(
                    labelText: "Seu Usuário",
                    hintText: "user",
                    inputFormatters: [
                      UpperCaseTextInputFormatter(),
                    ],
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return "Esse campo não pode ser vazio";
                      }
                      return null;
                    },
                  ),
                  CustomFormField(
                    labelText: "Seu Email",
                    hintText: "email@email.com",
                    inputFormatters: [
                      UpperCaseTextInputFormatter(),
                    ],
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return "Esse campo não pode ser vazio";
                      }
                      return null;
                    },
                  ),
                  PasswordFormFild(
                    labelText: "Escolha sua senha",
                    hintText: "******",
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return "Esse campo não pode ser vazio";
                      }
                      return null;
                    },
                  ),
                  PasswordFormFild(
                    labelText: "Confirme sua senha",
                    hintText: "******",
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return "Esse campo não pode ser vazio";
                      }
                      return null;
                    },
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
              onPressed: () {
                final valid = _formKey.currentState != null &&
                    _formKey.currentState!.validate();
                if (valid) {
                  print('continuar logica de login');
                } else {
                  print('erro ao logar');
                }
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
        ],
      ),
    );
  }
}
