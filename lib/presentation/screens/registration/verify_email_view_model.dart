import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_pay/core/dependency_injection/injection_container.dart';
import 'package:smart_pay/models/viewmodel_state.dart';
import 'package:smart_pay/navigation/navigation_service.dart';
import 'package:smart_pay/services/auth_service.dart';

//state represents the timer
class VerifyEmailViewModel extends Cubit<ViewModelState<int>> {
  VerifyEmailViewModel() : super(ViewModelState.init(30)) {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      emit(state.setData(state.data - 1));
      if (state.data == 0) {
        timer.cancel();
      }
    });
  }
  final _authService = sl.get<IAuthService>();
  final _navigator = sl.get<NavigationService>();

  void resendCode() async {
    emit(state.setData(30));
    Timer.periodic(const Duration(seconds: 1), (timer) {
      emit(state.setData(state.data - 1));
      if (state.data == 0) {
        timer.cancel();
      }
    });
  }

  void onCodeEdit(String val) {
    if (val.length < 5 && state.buttonEnabled) {
      emit(state.setButtonEnabled(false));

      return;
    }
    if (val.length == 5) {
      emit(state.setButtonEnabled(true));
    }
  }

  Future<void> submit(String email, String code) async {
    if (!state.loading) {
      emit(state.setLoading());
      try {
        final response = await _authService.verifyEmail(email, code);
        _navigator.navigate('/personal_info', arguments: response.data);
        emit(state.setLoading(false));
      } catch (_) {
        emit(state.setLoading(false));
      }
    }
  }
}
