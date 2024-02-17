import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smart_pay/core/dependency_injection/injection_container.dart';
import 'package:smart_pay/models/network_response.dart';
import 'package:smart_pay/navigation/navigation_service.dart';
import 'package:smart_pay/presentation/screens/login/view_model.dart';
import 'package:smart_pay/services/auth_service.dart';

import 'utils/mocked_classes.dart';
import 'utils/mocked_data.dart';

void main() {
  group('Login view model', () {
    late LoginViewModel sut;
    late MockAuthService authService;
    late MockNavigationService navigationService;
    late MockUserCubit userCubit;
    late MockFormState formState;
    late MockFormKey formKey;

    setUp(() {
      navigationService = MockNavigationService();
      authService = MockAuthService();
      sl.allowReassignment = true;
      sl.registerLazySingleton<NavigationService>(() => navigationService);
      sl.registerLazySingleton<IAuthService>(() => authService);
      userCubit = MockUserCubit();
      formState = MockFormState();
      formKey = MockFormKey();
      sut = LoginViewModel(userCubit, formKey);
    });

    tearDown(() {
      GetIt.I.reset();
      sut.close();
    });

    test('should navigate to new screen on successful login', () async {
      //arrange
      when(() => formState.validate()).thenReturn(true);
      when(() => formKey.currentState).thenReturn(formState);
      when(() => authService.login('email', 'password')).thenAnswer((_) async =>
          NetworkResponse(
              status: true, message: 'message', data: MockedData.user));
      when(() => userCubit.setUser(MockedData.user)).thenAnswer((_) => null);
      when(() => navigationService.resetWith('/dashboard')).thenReturn(null);

      //act
      await sut.submit('email', 'password');

      verify(() => navigationService.resetWith('/dashboard')).called(1);
    });
    test('should not navigate to new screen on failed login', () async {
      when(() => formState.validate()).thenReturn(false);
      when(() => formKey.currentState).thenReturn(formState);
      when(() => authService.login('email', 'password')).thenThrow(Error());

      await sut.submit('email', 'password');

      verifyNever(() => navigationService.resetWith('/dashboard'));
    });

    test('should not login if form is invalid', () async {
      when(() => formState.validate()).thenReturn(false);
      when(() => formKey.currentState).thenReturn(formState);
      when(() => authService.login('email', 'password')).thenThrow(Error());

      await sut.submit('email', 'password');

      verifyNever(() => authService.login('email', 'password'));
    });
  });
}
