import 'package:financas/common/constants/routes.dart';
import 'package:financas/common/utils/utils.dart';
import 'package:financas/features/sign_up/sign_up_controller.dart';
import 'package:financas/features/sign_up/sign_up_state.dart';
import 'package:financas/locator.dart';
import 'package:financas/widgets/custom_bottom_sheet.dart';
import 'package:financas/widgets/custom_text_form_field.dart';
import 'package:financas/widgets/password_form_field.dart';
import 'package:flutter/material.dart';
import 'package:financas/common/constants/app_colors.dart';
import 'package:financas/common/constants/app_text_styles.dart';
import 'package:financas/widgets/custom_text_button.dart';
import 'package:financas/widgets/primary_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _controller = locator.get<SignUpController>();

  @override
  void dispose() {
    _passwordController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.state is SignUpLoadingState) {
        showDialog(
            context: context,
            builder: (context) => const Center(
                    child: CircularProgressIndicator(
                  color: AppColors.primary,
                )));
      }
      if (_controller.state is SignUpSuccessState) {
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, NamedRoute.home);
      }

      if (_controller.state is SignUpErrorState) {
        final error = _controller.state as SignUpErrorState;
        Navigator.pop(context);
        customBottomSheet(context, error.message);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lavender,
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Text('Comece a controlar...',
              textAlign: TextAlign.center,
              style:
                  AppTextStyles.mediumText.copyWith(color: AppColors.primary)),
          Text('...seus gastos.',
              textAlign: TextAlign.center,
              style: AppTextStyles.mediumText
                  .copyWith(color: AppColors.secundary)),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.03,
            ),
            child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.2,
                child: Image.asset('assets/images/signUp.png')),
          ),
          Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomFormField(
                    controller: _nameController,
                    labelText: "Seu Usuário",
                    hintText: "user",
                    inputFormatters: [
                      UpperCaseTextInputFormatter(),
                    ],
                    validator: Validator.validateName,
                  ),
                  CustomFormField(
                      controller: _emailController,
                      labelText: "Seu Email",
                      hintText: "email@email.com",
                      validator: Validator.validateEmail),
                  PasswordFormFild(
                    controller: _passwordController,
                    labelText: "Escolha sua senha",
                    hintText: "******",
                    validator: Validator.validatePassword,
                    helperText:
                        'Deve conter 8 caracteres, um maiúsculo e um número',
                  ),
                  PasswordFormFild(
                    labelText: "Confirme sua senha",
                    hintText: "******",
                    validator: (value) => Validator.validateConfirmPassword(
                        value, _passwordController.text),
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
                  _controller.signUp(
                    name: _nameController.text,
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                } else {
                  print('erro ao logar');
                }
              },
            ),
          ),
          CustomTextButton(
            onPressed: () =>
                {Navigator.popAndPushNamed(context, NamedRoute.signIn)},
            children: [
              Text(
                'Ja tem uma conta?',
                textAlign: TextAlign.center,
                style: AppTextStyles.smallText.copyWith(
                  color: AppColors.darkGrey,
                ),
              ),
              Text(
                'Entrar',
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
