import 'package:dio/dio.dart';

import '../../../../../core/networking/api_base_response.dart';
import '../../../home/data/models/models.dart';
import '../models/models.dart';

class ProductMeRemoteDatasource {
  final Dio _dio;
  ProductMeRemoteDatasource(this._dio);

  Future<ApiBaseResponse<List<ProductResponse>>> getProducts() async {
    try {
      final response = await _dio.get('products/me');
      return ApiBaseResponse.fromJson(
        response.data,
        (json) =>
            (json as List).map((e) => ProductResponse.fromJson(e)).toList(),
      );
    } on DioException catch (e) {
      throw e.response?.data['message'];
    }
  }

  Future<ApiBaseResponse<bool>> addProduct(ProductRequest request) async {
    try {
      final response =
          await _dio.post('product', data: await request.toFormData());
      return ApiBaseResponse.fromJson(response.data, (json) => true);
    } on DioException catch (e) {
      throw e.response?.data['message'];
    }
  }
}
