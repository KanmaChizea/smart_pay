import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smart_pay/core/dependency_injection/injection_container.dart';
import 'package:smart_pay/models/network_response.dart';
import 'package:smart_pay/navigation/navigation_service.dart';
import 'package:smart_pay/presentation/screens/registration/personal_info_viewmodel.dart';
import 'package:smart_pay/services/auth_service.dart';

import 'utils/mocked_classes.dart';
import 'utils/mocked_data.dart';

void main() {
  late PersonalInfoViewModel sut;
  late MockAuthService authService;
  late MockNavigationService navigator;

  setUp(() {
    navigator = MockNavigationService();
    authService = MockAuthService();
    sl.registerLazySingleton<NavigationService>(() => navigator);
    sl.registerLazySingleton<IAuthService>(() => authService);
    sut = PersonalInfoViewModel();
  });

  tearDown(() {
    sut.close();
    sl.reset();
  });

  test('that open bottom sheet updates state', () {
    sut.openBottomSheet();
    expect(sut.state.data.isBottomSheetOpen, true);
  });
  test('that select country updates state and closes bottom sheet', () {
    when(() => navigator.goBack()).thenReturn(null);
    sut.selectCountry(TextEditingController(), MockedData.countries.first);

    expect(sut.state.data.isBottomSheetOpen, false);
    expect(sut.state.data.selectedCountry, MockedData.countries.first);
    verify(() => navigator.goBack()).called(1);
  });
  test('that button is enabled when all fields are not empty', () {
    expect(sut.state.buttonEnabled, false);

    sut.onChangeText('random text', 0);
    sut.onChangeText('random text', 1);
    sut.onChangeText('random text', 2);
    sut.onChangeText('random text', 3);

    expect(sut.state.buttonEnabled, true);
  });
  test('that button is disabled when any field is empty', () {
    sut.onChangeText('', 0);
    sut.onChangeText('random text', 1);
    sut.onChangeText('random text', 2);
    sut.onChangeText('random text', 3);

    expect(sut.state.buttonEnabled, false);
  });
  test('should register user and navigate to pin setup on sucess', () async {
    when(() => authService.register(
            fullname: 'fullname',
            username: 'username',
            email: 'email',
            country: '',
            password: 'password'))
        .thenAnswer((_) async =>
            NetworkResponse(data: MockedData.user, status: true, message: ''));
    when(() => navigator.navigateAndPopUntil('/login', '/set_pin',
        arguments: 'fullname')).thenReturn(null);

    await sut.submit(
        fullname: 'fullname',
        username: 'username',
        password: 'password',
        email: 'email');

    verify(() => navigator.navigateAndPopUntil('/login', '/set_pin',
        arguments: 'fullname')).called(1);
  });
}
