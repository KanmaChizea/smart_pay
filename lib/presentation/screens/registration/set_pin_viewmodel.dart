import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_pay/main.dart';
import 'package:smart_pay/models/viewmodel_state.dart';

class SetPinViewModel extends Cubit<ViewModelState<void>> {
  SetPinViewModel() : super(ViewModelState.init(null));

  void onCodeEdit(String val) {
    if (val.length < 5 && state.buttonEnabled) {
      emit(state.setButtonEnabled(false));

      return;
    }
    if (val.length == 5) {
      emit(state.setButtonEnabled(true));
    }
  }

  void submit(String name) => navigatorKey.currentState!.pushReplacementNamed(
        '/success',
        arguments: (
          title: 'Congratulations, $name',
          text: 'You’ve completed the onboarding, you can start using',
          buttonText: 'Get Started',
          buttonFunction: () => navigatorKey.currentState!.pop(),
        ),
      );
}
