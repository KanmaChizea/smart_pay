import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_pay/core/cubits/user_cubit.dart';
import 'package:smart_pay/core/dependency_injection/injection_container.dart';
import 'package:smart_pay/models/viewmodel_state.dart';
import 'package:smart_pay/navigation/navigation_service.dart';
import 'package:smart_pay/services/auth_service.dart';

class LoginViewModel extends Cubit<ViewModelState<void>> {
  LoginViewModel(UserCubit userCubit)
      : _userCubit = userCubit,
        super(ViewModelState.init(null));

  GlobalKey<FormState> formKey = GlobalKey();
  final UserCubit _userCubit;
  final _authService = sl.get<IAuthService>();
  final _navigator = sl.get<NavigationService>();

  void submit(String email, String password) async {
    if (!state.loading && formKey.currentState!.validate()) {
      emit(state.setLoading());
      try {
        final response = await _authService.login(email, password);
        _userCubit.setUser(response.data);
        _navigator.resetWith('/dashboard');
      } catch (_) {
        emit(state.setLoading(false));
      }
    }
  }

  void goToForgotPassword() => _navigator.navigate('/forgot_password');

  void goToSignup() => _navigator.navigate('/start_registration');
}
