import 'package:fpdart/fpdart.dart';

import '../../domain/models/history_model.dart';

import '../../domain/repositories/repositories.dart';
import '../datasources/transaction_remote_datasource.dart';
import '../models/request/transaction_request.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionRemoteDatasource _remoteDatasource;
  TransactionRepositoryImpl(this._remoteDatasource);

  @override
  Future<Either<String, bool>> createTransaction(
      TransactionRequest request) async {
    try {
      final result = await _remoteDatasource.createTransaction(request);
      return Right(result.data);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<HistoryModel>>> getTransactions() async {
    try {
      final result = await _remoteDatasource.getTransactions();
      return Right(result.data.map((e) => e.toDomain()).toList());
    } catch (e) {
      return Left(e.toString());
    }
  }
}
