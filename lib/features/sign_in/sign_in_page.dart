import 'package:financas/common/constants/routes.dart';
import 'package:financas/common/utils/utils.dart';
import 'package:financas/features/sign_in/sign_in_state.dart';
import 'package:financas/features/sign_in/sign_in_controller.dart';
import 'package:financas/services/mock_auth_service.dart';
import 'package:financas/widgets/custom_bottom_sheet.dart';
import 'package:financas/widgets/custom_text_form_field.dart';
import 'package:financas/widgets/password_form_field.dart';
import 'package:flutter/material.dart';
import 'package:financas/common/constants/app_colors.dart';
import 'package:financas/common/constants/app_text_styles.dart';
import 'package:financas/widgets/custom_text_button.dart';
import 'package:financas/widgets/primary_button.dart';
import 'package:flutter/widgets.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _controller = SignInController(MockAuthService());

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
      if (_controller.state is SignInLoadingState) {
        showDialog(
            context: context,
            builder: (context) => const Center(
                    child: CircularProgressIndicator(
                  color: AppColors.primary,
                )));
      }
      if (_controller.state is SignInSuccessState) {
        Navigator.pop(context);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Scaffold(
                body: Center(child: Text("nova Tela")),
              ),
            ));
      }

      if (_controller.state is SignInErrorState) {
        final error = _controller.state as SignInErrorState;
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
          Text('Seja Bem Vindo...',
              textAlign: TextAlign.center,
              style:
                  AppTextStyles.mediumText.copyWith(color: AppColors.primary)),
          Text('...de volta',
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
                child: Image.asset('assets/images/SignIn.png')),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.05,
            ),
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomFormField(
                        controller: _emailController,
                        labelText: "Seu Email",
                        hintText: "email@email.com",
                        validator: Validator.validateEmail),
                    PasswordFormFild(
                      controller: _passwordController,
                      labelText: "Sua senha",
                      hintText: "******",
                      validator: Validator.validatePassword,
                      helperText:
                          'Deve conter 8 caracteres, um maiúsculo e um número',
                    ),
                  ],
                )),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.height * 0.032,
              vertical: MediaQuery.of(context).size.height * 0.016,
            ),
            child: PrimaryButton(
              text: 'Entrar',
              onPressed: () {
                final valid = _formKey.currentState != null &&
                    _formKey.currentState!.validate();
                if (valid) {
                  _controller.signIn(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                } else {
                  print('erro ao entrar');
                }
              },
            ),
          ),
          CustomTextButton(
            onPressed: () =>
                {Navigator.popAndPushNamed(context, NamedRoute.signUp)},
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
