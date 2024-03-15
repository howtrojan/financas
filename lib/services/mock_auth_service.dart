import 'package:financas/common/models/user_model.dart';
import 'package:financas/services/auth_service.dart';

class MockAuthService implements AuthService {
  @override
  Future signIn() {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<UserModel> signUp(
      {required String email, required String password, String? name}) async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      if (password.startsWith('123')) {
        throw Exception();
      }
      return UserModel(email.hashCode, name, email, password);
    } catch (e) {
      if (password.startsWith('123')) {
        throw 'Senha Insegura. Crie uma senha forte';
      }
      throw 'Não foi possível criar sua conta. Tente mais tarde';
    }
  }
}
