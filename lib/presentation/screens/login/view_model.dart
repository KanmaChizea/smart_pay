import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_pay/core/dependency_injection/injection_container.dart';
import 'package:smart_pay/main.dart';
import 'package:smart_pay/models/viewmodel_state.dart';
import 'package:smart_pay/services/auth_service.dart';

class LoginViewModel extends Cubit<ViewModelState<void>> {
  LoginViewModel() : super(ViewModelState.init(null));

  GlobalKey<FormState> formKey = GlobalKey();

  final _authService = sl.get<IAuthService>();

  void submit(String email, String password) async {
    if (!state.loading && formKey.currentState!.validate()) {
      emit(state.setLoading());
      try {
        final response = await _authService.login(email, password);
        navigatorKey.currentState?.pushNamedAndRemoveUntil(
          '/dashboard',
          (route) => false,
          arguments: response.message,
        );
      } catch (_) {
        emit(state.setLoading(false));
      }
    }
  }

  void goToForgotPassword() =>
      navigatorKey.currentState?.pushNamed('/forgot_password');

  void goToSignup() =>
      navigatorKey.currentState?.pushNamed('/start_registration');
}
