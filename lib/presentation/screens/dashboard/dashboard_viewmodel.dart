import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_pay/core/dependency_injection/injection_container.dart';
import 'package:smart_pay/services/auth_service.dart';

class DashboardViewModal extends Cubit<bool> {
  DashboardViewModal() : super(false);

  final _authService = sl.get<IAuthService>();
  void logout() async {
    emit(true);
    try {
      await _authService.logout();
    } catch (e) {
      emit(false);
    }
  }
}
