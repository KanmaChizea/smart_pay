import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_pay/services/auth_service.dart';
import 'package:smart_pay/services/country_service.dart';
import 'package:smart_pay/utils/dio_helper.dart';

final sl = GetIt.instance;

void init() {
  sl.registerLazySingleton<Dio>(() => DioHelper.instance);
  sl.registerLazySingleton<IAuthService>(() => AuthService());
  sl.registerLazySingleton<ICountryService>(() => CountryService());
}
