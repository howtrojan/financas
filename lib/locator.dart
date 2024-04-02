import 'package:financas/features/home/home_controller.dart';
import 'package:financas/features/sign_in/sign_in_controller.dart';
import 'package:financas/features/sign_up/sign_up_controller.dart';
import 'package:financas/features/splash/splash_controller.dart';
import 'package:financas/repositories/transaction_repository.dart';
import 'package:financas/services/auth_service.dart';
import 'package:financas/services/firebase_auth_service.dart';
import 'package:financas/services/secure_storage.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupDependecies() {
  locator.registerLazySingleton<AuthService>(() => FirebaseAuthService());
  locator.registerLazySingleton<SecureStorageService>(
      () => const SecureStorageService());

  locator.registerFactory<SplashController>(
    () => SplashController(
      secureStorageService: locator.get<SecureStorageService>(),
    ),
  );

  locator.registerFactory<SignInController>(
      () => SignInController(locator.get<AuthService>()));
  locator.registerFactory<SignUpController>(
      () => SignUpController(locator.get<AuthService>()));

  locator.registerFactory<TransactionRepository>(
      () => TransactionRepositoryImpl());

  locator.registerLazySingleton<HomeController>(
      () => HomeController(locator.get<TransactionRepository>()));
}
