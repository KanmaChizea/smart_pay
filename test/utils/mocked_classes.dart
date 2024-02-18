import 'package:mocktail/mocktail.dart';
import 'package:smart_pay/core/cubits/theme_cubit.dart';
import 'package:smart_pay/core/cubits/user_cubit.dart';
import 'package:smart_pay/navigation/navigation_service.dart';
import 'package:smart_pay/services/auth_service.dart';
import 'package:smart_pay/services/country_service.dart';
import 'package:smart_pay/services/dashboard_service.dart';
import 'package:smart_pay/services/secure_storage.dart';

class MockCountryService extends Mock implements ICountryService {}

class MockUserCubit extends Mock implements UserCubit {}

class MockAuthService extends Mock implements IAuthService {}

class MockThemeCubit extends Mock implements ThemeCubit {}

class MockDashboardService extends Mock implements IDashboardService {}

class MockNavigationService extends Mock implements NavigationService {}

class MockSecureStorageHelper extends Mock implements SecureStorageHelper {}
