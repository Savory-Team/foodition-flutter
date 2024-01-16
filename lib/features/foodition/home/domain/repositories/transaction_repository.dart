import 'package:fpdart/fpdart.dart';

import '../../data/models/models.dart';
import '../models/models.dart';

abstract class TransactionRepository {
  Future<Either<String, List<HistoryModel>>> getTransactions();
  Future<Either<String, bool>> createTransaction(TransactionRequest request);
}
