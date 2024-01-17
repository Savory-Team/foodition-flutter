import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../../core/networking/api_base_response.dart';
import '../models/models.dart';

class RestoRemoteDatasource {
  final Dio _dio;
  RestoRemoteDatasource(this._dio);

  Future<ApiBaseResponse<RestoResponse>> getMyResto() async {
    try {
      final response = await _dio.get('resto/my');
      return ApiBaseResponse.fromJson(
        response.data,
        (json) => RestoResponse.fromJson(json),
      );
    } on DioException catch (e) {
      throw e.response?.data['message'];
    }
  }

  Future<ApiBaseResponse<bool>> editResto(RestoRequest request) async {
    try {
      final response = await _dio.put('resto/me', data: request.toMap());
      return ApiBaseResponse.fromJson(response.data, (json) => true);
    } on DioException catch (e) {
      throw e.response?.data['message'];
    }
  }

  Future<ApiBaseResponse<bool>> editAddress(AddressRequest request) async {
    try {
      final response = await _dio.put('resto/me/alamat', data: request.toMap());
      return ApiBaseResponse.fromJson(response.data, (json) => true);
    } on DioException catch (e) {
      throw e.response?.data['message'];
    }
  }

  Future<ApiBaseResponse<bool>> editPhotoResto(File image) async {
    try {
      final formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(
          image.path,
          filename: 'photo-resto.jpg',
        ),
      });
      final response = await _dio.put('resto/me/photo', data: formData);
      return ApiBaseResponse.fromJson(response.data, (json) => true);
    } on DioException catch (e) {
      throw e.response?.data['message'];
    }
  }
}
