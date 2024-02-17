import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smart_pay/core/dependency_injection/injection_container.dart';
import 'package:smart_pay/models/network_response.dart';
import 'package:smart_pay/navigation/navigation_service.dart';
import 'package:smart_pay/presentation/screens/registration/verify_email_view_model.dart';
import 'package:smart_pay/services/auth_service.dart';

import 'utils/mocked_classes.dart';

void main() {
  late VerifyEmailViewModel sut;
  late MockAuthService authService;
  late MockNavigationService navigator;

  setUp(() {
    navigator = MockNavigationService();
    authService = MockAuthService();

    sl.registerLazySingleton<NavigationService>(() => navigator);
    sl.registerLazySingleton<IAuthService>(() => authService);
    sut = VerifyEmailViewModel();
  });
  tearDown(() {
    sut.close();
    sl.reset();
  });
  test('that button is disabled when code is less than 5digits', () {
    sut.onCodeEdit('123');
    expect(sut.state.buttonEnabled, false);
  });
  test('that button is enabled when code is 5 disgits', () {
    sut.onCodeEdit('11111');
    expect(sut.state.buttonEnabled, true);
  });

  test(
      'should navigate to personal info on sucessful request with response data as argument',
      () async {
    when(() => authService.verifyEmail('email', 'token')).thenAnswer(
        (_) async => NetworkResponse(
            status: true, message: 'message', data: 'responseData'));
    when(() => navigator.navigate('/personal_info', arguments: 'responseData'))
        .thenReturn(null);

    await sut.submit('email', 'token');

    verify(() =>
            navigator.navigate('/personal_info', arguments: 'responseData'))
        .called(1);
  });
  test('should not navigate to personal info on failed request', () async {
    when(() => authService.verifyEmail('email', 'token')).thenThrow(Error());

    await sut.submit('email', 'token');

    verifyNever(
        () => navigator.navigate('/personal_info', arguments: 'responseData'));
  });
}
