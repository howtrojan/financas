import 'package:financas/common/models/user_model.dart';

abstract class AuthService {
  Future<UserModel> signUp({
    required String email,
    required String password,
    String? name,
  });

  Future signIn();
}
