import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:smart_pay/main.dart';

import 'package:smart_pay/presentation/widgets/error_dialog.dart';

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

  static void setupInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // add bearer token

          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          //TODO: handle error message
          final errorMessage = e.response?.data['message'];
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
