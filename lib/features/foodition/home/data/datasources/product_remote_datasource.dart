import 'package:dio/dio.dart';

import '../../../../../core/networking/networking.dart';
import '../models/models.dart';

class ProductRemoteDatasource {
  final Dio _dio;
  ProductRemoteDatasource(this._dio);

  Future<ApiBaseResponse<List<ProductResponse>>> getProducts() async {
    try {
      final response = await _dio.get('products');
      return ApiBaseResponse.fromJson(
        response.data,
        (json) =>
            (json as List).map((e) => ProductResponse.fromJson(e)).toList(),
      );
    } on DioException catch (e) {
      throw e.response?.data['message'];
    }
  }

  Future<ApiBaseResponse<ProductResponse>> productDetail(String id) async {
    try {
      final response = await _dio.get('product/$id');
      return ApiBaseResponse.fromJson(
        response.data,
        (json) => ProductResponse.fromJson(json),
      );
    } on DioException catch (e) {
      throw e.response?.data['message'];
    }
  }
}
