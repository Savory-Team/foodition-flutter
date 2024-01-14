import 'package:dio/dio.dart';

import '../../../../core/networking/networking.dart';
import '../models/models.dart';

class AuthRemoteDatasource {
  final Dio _dio;
  AuthRemoteDatasource(this._dio);

  Future<String> login(LoginRequest request) async {
    try {
      final response = await _dio.post('auth/login', data: request.toMap());
      final token = response.data['data']['token'];
      return 'Bearer $token';
    } on DioException catch (e) {
      throw e.response?.data['message'];
    }
  }

  Future<bool> register(RegisterRequest request) async {
    try {
      await _dio.post('auth/register', data: request.toMap());
      return true;
    } on DioException catch (e) {
      throw e.response?.data['message'];
    }
  }

  Future<bool> verify(VerifyRequest request) async {
    try {
      await _dio.post('auth/otp/verify', data: request.toMap());
      return true;
    } on DioException catch (e) {
      throw e.response?.data['message'];
    }
  }

  Future<ApiBaseResponse<UserResponse>> show(String token) async {
    try {
      final response = await _dio.get('user/me/detail',
          options: Options(headers: {'Authorization': token}));
      return ApiBaseResponse.fromJson(
        response.data,
        (json) => UserResponse.fromJson(json),
      );
    } on DioException catch (e) {
      throw e.response?.data['message'];
    }
  }
}
