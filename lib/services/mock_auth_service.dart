import 'package:financas/common/models/user_model.dart';
import 'package:financas/services/auth_service.dart';

class MockAuthService implements AuthService {
  @override
  Future<UserModel> signIn(
      {required String email, required String password}) async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      if (password.startsWith('123')) {
        throw Exception();
      }
      return UserModel(id: email.hashCode, email: email, password: password);
    } catch (e) {
      if (password.startsWith('123')) {
        throw 'Erro ao logar. Tente novamente';
      }
      throw 'Não foi possível realizar login. Tente mais tarde';
    }
  }

  @override
  Future<UserModel> signUp(
      {required String email, required String password, String? name}) async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      if (password.startsWith('123')) {
        throw Exception();
      }
      return UserModel(
          id: email.hashCode, name: name, email: email, password: password);
    } catch (e) {
      if (password.startsWith('123')) {
        throw 'Senha Insegura. Crie uma senha forte';
      }
      throw 'Não foi possível criar sua conta. Tente mais tarde';
    }
  }
}
