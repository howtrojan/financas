import 'package:financas/features/sign_in/sign_in_state.dart';
import 'package:financas/services/auth_service.dart';
import 'package:flutter/material.dart';

class SignInController extends ChangeNotifier {
  final AuthService _service;

  SignInController(this._service);

  SignInState _state = SignInInitialState();

  SignInState get state => _state;

  void _changeState(SignInState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> signIn({required String email, required String password}) async {
    _changeState(SignInLoadingState());

    try {
      final result = await _service.signIn(email: email, password: password);
      _changeState(SignInSuccessState());
    } catch (e) {
      _changeState(SignInErrorState(e.toString()));
    }
  }
}
