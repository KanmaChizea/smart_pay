import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_pay/core/dependency_injection/injection_container.dart';

import 'package:smart_pay/models/country.dart';
import 'package:smart_pay/models/viewmodel_state.dart';
import 'package:smart_pay/navigation/navigation_service.dart';
import 'package:smart_pay/services/auth_service.dart';

class PersonalInfoViewState {
  final bool isBottomSheetOpen;
  final Country? selectedCountry;
  PersonalInfoViewState({
    required this.isBottomSheetOpen,
    this.selectedCountry,
  });

  PersonalInfoViewState copyWith({
    bool? isBottomSheetOpen,
    Country? selectedCountry,
  }) {
    return PersonalInfoViewState(
      isBottomSheetOpen: isBottomSheetOpen ?? this.isBottomSheetOpen,
      selectedCountry: selectedCountry ?? this.selectedCountry,
    );
  }
}

class PersonalInfoViewModel
    extends Cubit<ViewModelState<PersonalInfoViewState>> {
  PersonalInfoViewModel()
      : super(
          ViewModelState.init(
            PersonalInfoViewState(isBottomSheetOpen: false),
          ),
        );
  GlobalKey<FormState> formKey = GlobalKey();

  final _authService = sl.get<IAuthService>();
  final _navigator = sl.get<NavigationService>();
  List<bool> validFields = [false, false, false, false];

  void openBottomSheet() {
    emit(
      state.setData(
        state.data.copyWith(isBottomSheetOpen: true),
      ),
    );
  }

  void selectCountry(TextEditingController controller, Country country) {
    emit(
      state.setData(
        state.data.copyWith(isBottomSheetOpen: false, selectedCountry: country),
      ),
    );
    _navigator.goBack();
    controller.text = country.name;
    onChangeText(controller.text, 2);
  }

  void submit(
      {required String fullname,
      required String username,
      required String password,
      required String email}) async {
    if (!state.loading && formKey.currentState!.validate()) {
      emit(state.setLoading());
      try {
        final result = await _authService.register(
            fullname: fullname,
            username: username,
            email: email,
            country: state.data.selectedCountry?.code ?? '',
            password: password);
        emit(state.setLoading(false));
        _navigator.navigateAndPopUntil('/login', '/set_pin',
            arguments: result.data.fullname.split(' ').length > 1
                ? result.data.fullname.split(' ')[0]
                : result.data.fullname);
      } catch (_) {
        emit(state.setLoading(false));
      }
    }
  }

  void onChangeText(String val, int index) {
    if (val.isEmpty) {
      validFields[index] = false;
    } else {
      validFields[index] = true;
    }
    final isAllFieldsValid = !validFields.contains(false);
    if (state.buttonEnabled != isAllFieldsValid) {
      emit(state.setButtonEnabled(isAllFieldsValid));
    }
  }
}
