import 'package:financas/common/constants/app_colors.dart';
import 'package:financas/common/constants/app_text_styles.dart';
import 'package:financas/common/constants/routes.dart';
import 'package:financas/common/extensions/sizes.dart';
import 'package:financas/features/splash/splash_controller.dart';
import 'package:financas/features/splash/splash_state.dart';
import 'package:financas/locator.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _splashController = locator.get<SplashController>();

  @override
  void initState() {
    super.initState();
    _splashController.isUserLogged();
    _splashController.addListener(_handleSplashStateChange);
    WidgetsBinding.instance.addPostFrameCallback((_) => Sizes.init(context));
  }

  @override
  void dispose() {
    _splashController.dispose();
    super.dispose();
  }

  void _handleSplashStateChange() {
    if (_splashController.state is AuthenticatedUser) {
      Navigator.pushReplacementNamed(
        context,
        NamedRoute.home,
      );
    } else {
      Navigator.pushReplacementNamed(
        context,
        NamedRoute.initial,
      );
    }
  }

  void _handleSyncStateChange() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.primary, AppColors.secundary])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Finanças',
              style: AppTextStyles.bigText.copyWith(color: AppColors.white),
            ),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
