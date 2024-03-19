import 'package:financas/features/sign_in/sign_in_controller.dart';
import 'package:financas/features/sign_up/sign_up_controller.dart';
import 'package:financas/services/auth_service.dart';
import 'package:financas/services/firebase_auth_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupDependecies() {
  locator.registerLazySingleton<AuthService>(() => FirebaseAuthService());

  locator.registerFactory<SignInController>(
      () => SignInController(locator.get<AuthService>()));
  locator.registerFactory<SignUpController>(
      () => SignUpController(locator.get<AuthService>()));
}
