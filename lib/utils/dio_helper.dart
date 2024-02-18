import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:smart_pay/core/dependency_injection/injection_container.dart';
import 'package:smart_pay/main.dart';

import 'package:smart_pay/presentation/widgets/error_dialog.dart';
import 'package:smart_pay/services/secure_storage.dart';

/// Dio singleton for the entire application
///
class DioHelper {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://mobile-test-2d7e555a4f85.herokuapp.com/api/v1/',
    ),
  );

  static Dio get instance {
    setupInterceptors();
    return _dio;
  }

  /// Interceptors to handle all the common logic of network requests
  /// On error, displays error dialog box with error message returned from
  /// the backend
  ///
  /// On request, fetches bearer token from db and adds to request headers
  ///
  static void setupInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final secureStorage = sl.get<SecureStorageHelper>();
          final token = await secureStorage.read('token');
          if (token != null) {
            options.headers.addAll({
              'Authorization': 'Bearer $token',
            });
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          final errorMessage =
              e.response?.data['message'] ?? 'Something went wrong';
          showDialog(
            barrierDismissible: false,
            context: navigatorKey.currentContext!,
            builder: (context) => ErrorDialog(errorMessage: errorMessage),
          );
          return handler.next(e);
        },
      ),
    );
  }
}
