import 'dart:developer';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:financas/common/models/user_model.dart';
import 'package:financas/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService implements AuthService {
  final _auth = FirebaseAuth.instance;
  final _functions = FirebaseFunctions.instance;

  @override
  Future<UserModel> signIn(
      {required String email, required String password}) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (result.user != null) {
        return UserModel(
            name: result.user!.displayName,
            email: result.user!.email,
            id: result.user!.uid);
      } else {
        throw Exception();
      }
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "null";
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
    try {
      await _functions.httpsCallable('registerUser').call({
        'email': email,
        'password': password,
        'displayName': name,
      });

      final result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (result.user != null) {
        print(await _auth.currentUser?.getIdToken(true) ?? 'nulo');
        await result.user!.updateDisplayName(name);
        return UserModel(
            name: _auth.currentUser?.displayName,
            email: _auth.currentUser?.email,
            id: _auth.currentUser?.uid);
      } else {
        throw Exception();
      }
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "null";
    } on FirebaseFunctionsException catch (e) {
      throw e.message ?? "null";
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
