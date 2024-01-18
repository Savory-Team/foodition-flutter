import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../../core/networking/api_base_response.dart';
import '../models/models.dart';

class UserRemoteDatasource {
  final Dio _dio;
  UserRemoteDatasource(this._dio);

  Future<ApiBaseResponse<UserResponse>> show() async {
    try {
      final response = await _dio.get('user/my');
      return ApiBaseResponse.fromJson(
        response.data,
        (json) => UserResponse.fromJson(json),
      );
    } on DioException catch (e) {
      throw e.response?.data['message'];
    }
  }

  Future<ApiBaseResponse<bool>> editAddress(AddressRequest request) async {
    try {
      final response = await _dio.put('user/me/alamat', data: request.toMap());
      return ApiBaseResponse.fromJson(response.data, (json) => true);
    } on DioException catch (e) {
      throw e.response?.data['message'];
    }
  }

  Future<ApiBaseResponse<bool>> editBio(String bio) async {
    try {
      final response = await _dio.put('user/me/bio', data: {'bio': bio});
      return ApiBaseResponse.fromJson(response.data, (json) => true);
    } on DioException catch (e) {
      throw e.response?.data['message'];
    }
  }

  Future<ApiBaseResponse<bool>> editBirthdate(DateTime birthdate) async {
    try {
      final response = await _dio
          .put('user/me/tanggalLahir', data: {'tanggalLahir': birthdate});
      return ApiBaseResponse.fromJson(response.data, (json) => true);
    } on DioException catch (e) {
      throw e.response?.data['message'];
    }
  }

  Future<ApiBaseResponse<bool>> editGender(bool isMale) async {
    try {
      final response = await _dio
          .put('user/me/jenisKelamin', data: {'jenisKelamin': isMale});
      return ApiBaseResponse.fromJson(response.data, (json) => true);
    } on DioException catch (e) {
      throw e.response?.data['message'];
    }
  }

  Future<ApiBaseResponse<bool>> editName(String name) async {
    try {
      final response = await _dio.put('user/me/nama', data: {'nama': name});
      return ApiBaseResponse.fromJson(response.data, (json) => true);
    } on DioException catch (e) {
      throw e.response?.data['message'];
    }
  }

  Future<ApiBaseResponse<bool>> editPassword(PasswordRequest request) async {
    try {
      final response =
          await _dio.put('user/me/forgot/password', data: request.toMap());
      return ApiBaseResponse.fromJson(response.data, (json) => true);
    } on DioException catch (e) {
      throw e.response?.data['message'];
    }
  }

  Future<ApiBaseResponse<bool>> editPhoneNumber(String phoneNumber) async {
    try {
      final response =
          await _dio.put('user/me/noHp', data: {'noHp': '0$phoneNumber'});
      return ApiBaseResponse.fromJson(response.data, (json) => true);
    } on DioException catch (e) {
      throw e.response?.data['message'];
    }
  }

  Future<ApiBaseResponse<bool>> editPhotoProfile(File image) async {
    try {
      final formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(
          image.path,
          filename: 'photo-profile.jpg',
        ),
      });
      final response = await _dio.put('user/me/photo', data: formData);
      return ApiBaseResponse.fromJson(response.data, (json) => true);
    } on DioException catch (e) {
      throw e.response?.data['message'];
    }
  }

  Future<ApiBaseResponse<bool>> editUsername(String username) async {
    try {
      final response =
          await _dio.put('user/me/username', data: {'username': username});
      return ApiBaseResponse.fromJson(response.data, (json) => true);
    } on DioException catch (e) {
      throw e.response?.data['message'];
    }
  }
}
