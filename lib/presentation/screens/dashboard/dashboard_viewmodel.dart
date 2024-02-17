import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_pay/core/dependency_injection/injection_container.dart';
import 'package:smart_pay/models/viewmodel_state.dart';
import 'package:smart_pay/navigation/navigation_service.dart';
import 'package:smart_pay/services/auth_service.dart';
import 'package:smart_pay/services/dashboard_service.dart';

//data represents the secret message
class DashboardViewModal extends Cubit<ViewModelState<String>> {
  DashboardViewModal()
      : super(ViewModelState(loading: false, buttonEnabled: true, data: '')) {
    getMessage();
  }

  final _authService = sl.get<IAuthService>();
  final _dashboardService = sl.get<IDashboardService>();
  final _navigator = sl.get<NavigationService>();

  void getMessage() async {
    final response = await _dashboardService.getSecret();
    emit(state.setData(response.data));
  }

  void logout() async {
    emit(state.setLoading());
    emit(state.setButtonEnabled(false));
    try {
      await _authService.logout();
      _navigator.resetWith('/');
      _navigator.navigate('/login');
    } catch (e) {
      emit(state.setLoading(false));
      emit(state.setButtonEnabled(true));
    }
  }
}
