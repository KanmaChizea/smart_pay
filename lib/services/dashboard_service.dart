import 'package:dio/dio.dart';
import 'package:smart_pay/core/constants/endpoints.dart';
import 'package:smart_pay/core/dependency_injection/injection_container.dart';
import 'package:smart_pay/models/network_response.dart';

abstract class IDashboardService {
  Future<NetworkResponse<String>> getSecret();
}

class DashboardService implements IDashboardService {
  final Dio _dio = sl.get<Dio>();
  @override
  Future<NetworkResponse<String>> getSecret() async {
    final response = await _dio.get(Endpoints.dashboard);
    return NetworkResponse.fromMap(
      response.data,
      response.data['data']['secret'],
    );
  }
}
