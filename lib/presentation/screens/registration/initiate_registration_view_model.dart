import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_pay/core/dependency_injection/injection_container.dart';
import 'package:smart_pay/models/viewmodel_state.dart';
import 'package:smart_pay/navigation/navigation_service.dart';
import 'package:smart_pay/services/auth_service.dart';

class InitiateRegistrationViewModel extends Cubit<ViewModelState<void>> {
  InitiateRegistrationViewModel() : super(ViewModelState.init(null));
  final _authService = sl.get<IAuthService>();
  GlobalKey<FormState> formKey = GlobalKey();
  final _navigator = sl.get<NavigationService>();

  void goBack() => _navigator.goBack();

  void onEditEmail(String val) {
    if (val.isEmpty && state.buttonEnabled) {
      emit(state.setButtonEnabled(false));
    }
    if (val.isNotEmpty && !state.buttonEnabled) {
      emit(state.setButtonEnabled(true));
    }
  }

  void submit(String email) async {
    if (!state.loading && formKey.currentState!.validate()) {
      emit(state.setLoading());
      try {
        await _authService.getEmailToken(email);
        _navigator.navigate('/verify_email', arguments: email);
        emit(state.setLoading(false));
      } catch (_) {
        emit(state.setLoading(false));
      }
    }
  }
}
