import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:smart_pay/core/constants/device.dart';
import 'package:smart_pay/core/constants/endpoints.dart';
import 'package:smart_pay/core/dependency_injection/injection_container.dart';
import 'package:smart_pay/models/network_response.dart';
import 'package:smart_pay/models/user.dart';
import 'package:smart_pay/services/secure_storage.dart';

abstract class IAuthService {
  Future<NetworkResponse<User>> login(String email, String password);
  Future getEmailToken(String email);
  Future<NetworkResponse<String>> verifyEmail(String email, String token);
  Future<NetworkResponse<User>> register(
      {required String fullname,
      required String username,
      required String email,
      required String country,
      required String password});
  Future logout();
}

class AuthService implements IAuthService {
  final Dio _dio = sl.get<Dio>();
  final _secureStorage = sl.get<SecureStorageHelper>();

  @override
  Future getEmailToken(String email) async {
    final response =
        await _dio.post(Endpoints.getEmailToken, data: {'email': email});
    log(response.data.toString());
  }

  @override
  Future<NetworkResponse<String>> verifyEmail(
      String email, String token) async {
    final response = await _dio.post(
      Endpoints.verifyEmailToken,
      data: {'email': email, 'token': token},
    );
    return NetworkResponse.fromMap(
      response.data,
      response.data['data']['email'],
    );
  }

  @override
  Future<NetworkResponse<User>> register(
      {required String fullname,
      required String username,
      required String email,
      required String country,
      required String password}) async {
    final deviceName = await Device.name();
    final response = await _dio.post(Endpoints.register, data: {
      'full_name': fullname,
      'username': username,
      'email': email,
      'country': country,
      'password': password,
      'device_name': deviceName,
    });
    final user = User.fromMap(response.data['data']['user']);
    return NetworkResponse.fromMap(response.data, user);
  }

  @override
  Future<NetworkResponse<User>> login(String email, String password) async {
    final deviceName = await Device.name();
    final response = await _dio.post(Endpoints.login, data: {
      'email': email,
      'password': password,
      'device_name': deviceName,
    });

    await _secureStorage.write('token', response.data['data']['token']);
    final user = User.fromMap(response.data['data']['user']);
    return NetworkResponse.fromMap(response.data, user);
  }

  @override
  Future logout() async {
    await _dio.post(Endpoints.logout);
    await _secureStorage.delete('token');
  }
}
