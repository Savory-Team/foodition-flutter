import 'package:dio/dio.dart';

import '../../../../../core/networking/networking.dart';
import '../models/models.dart';

class TransactionRemoteDatasource {
  final Dio _dio;
  TransactionRemoteDatasource(this._dio);

  Future<ApiBaseResponse<List<TransactionResponse>>> getTransactions() async {
    try {
      final response = await _dio.get('history/users/me');
      return ApiBaseResponse.fromJson(
        response.data,
        (json) =>
            (json as List).map((e) => TransactionResponse.fromJson(e)).toList(),
      );
    } on DioException catch (e) {
      throw e.response?.data['message'];
    }
  }

  Future<ApiBaseResponse<bool>> createTransaction(
      TransactionRequest request) async {
    try {
      final response = await _dio.post('buy', data: request.toMap());
      return ApiBaseResponse.fromJson(
        response.data,
        (json) => true,
      );
    } on DioException catch (e) {
      throw e.response?.data['message'];
    }
  }
}
