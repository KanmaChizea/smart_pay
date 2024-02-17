import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_pay/core/dependency_injection/injection_container.dart';
import 'package:smart_pay/models/viewmodel_state.dart';
import 'package:smart_pay/navigation/navigation_service.dart';

class SetPinViewModel extends Cubit<ViewModelState<void>> {
  SetPinViewModel() : super(ViewModelState.init(null));
  final _navigator = sl.get<NavigationService>();

  void onCodeEdit(String val) {
    if (val.length < 5 && state.buttonEnabled) {
      emit(state.setButtonEnabled(false));
      return;
    }
    if (val.length == 5) {
      emit(state.setButtonEnabled(true));
    }
  }

  void submit(String name) => _navigator.replace(
        '/success',
        arguments: (
          title: 'Congratulations, $name',
          text: 'You’ve completed the onboarding, you can start using',
          buttonText: 'Get Started',
          buttonFunction: () => _navigator.goBack(),
        ),
      );
}
