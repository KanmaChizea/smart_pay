import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_pay/main.dart';
import 'package:smart_pay/navigation/navigation_service.dart';
import 'package:smart_pay/services/auth_service.dart';
import 'package:smart_pay/services/country_service.dart';
import 'package:smart_pay/services/dashboard_service.dart';
import 'package:smart_pay/services/secure_storage.dart';
import 'package:smart_pay/utils/dio_helper.dart';

final sl = GetIt.instance;

void init() {
  sl.registerLazySingleton<Dio>(() => DioHelper.instance);
  sl.registerLazySingleton<IAuthService>(() => AuthService());
  sl.registerLazySingleton<IDashboardService>(() => DashboardService());
  sl.registerLazySingleton<ICountryService>(() => CountryService());
  sl.registerLazySingleton<SecureStorageHelper>(() => SecureStorageHelper());

  sl.registerLazySingleton<NavigationService>(
    () => NavigationService(navigatorKey: navigatorKey),
  );
}
