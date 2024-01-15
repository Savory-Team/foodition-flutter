import 'dart:io';

import 'package:dio/dio.dart';

class MlRemoteDatasource {
  final Dio _dio;
  MlRemoteDatasource(this._dio);

  Future<String> predict(File image) async {
    try {
      final formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(
          image.path,
          filename: 'predict-image.jpg',
        ),
      });
      final response = await _dio.post('predict', data: formData);
      return response.data['status']['data']['class'];
    } on DioException catch (e) {
      throw e.response?.data['status']['message'];
    }
  }
}
