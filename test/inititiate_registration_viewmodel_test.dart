import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smart_pay/core/dependency_injection/injection_container.dart';
import 'package:smart_pay/models/network_response.dart';
import 'package:smart_pay/navigation/navigation_service.dart';
import 'package:smart_pay/presentation/screens/registration/initiate_registration_view_model.dart';
import 'package:smart_pay/services/auth_service.dart';

import 'utils/mocked_classes.dart';

void main() {
  group('Initiate Registration Viewmodel', () {
    late InitiateRegistrationViewModel sut;
    late MockAuthService authService;
    late MockNavigationService navigationService;

    setUp(() {
      navigationService = MockNavigationService();
      authService = MockAuthService();
      sl.registerLazySingleton<NavigationService>(() => navigationService);
      sl.registerLazySingleton<IAuthService>(() => authService);
      sut = InitiateRegistrationViewModel();
    });

    tearDown(() {
      sl.reset();
      sut.close();
    });

    test('that button is disabled when email is empty', () {
      sut.onEditEmail('');
      expect(sut.state.buttonEnabled, false);
    });
    test('that button is enabled when email is not empty', () {
      sut.onEditEmail('Email');
      expect(sut.state.buttonEnabled, true);
    });

    test('should navigate to verify email on sucessful request', () async {
      when(() => authService.getEmailToken('email')).thenAnswer((_) async =>
          NetworkResponse(status: true, message: 'message', data: ''));
      when(() =>
              navigationService.navigate('/verify_email', arguments: 'email'))
          .thenReturn(null);

      await sut.submit('email');

      verify(() =>
              navigationService.navigate('/verify_email', arguments: 'email'))
          .called(1);
    });
    test('should not navigate to verify email on failed request', () async {
      when(() => authService.getEmailToken('email')).thenThrow(Error());

      await sut.submit('email');

      verifyNever(() =>
          navigationService.navigate('/verify_email', arguments: 'email'));
    });
  });
}
