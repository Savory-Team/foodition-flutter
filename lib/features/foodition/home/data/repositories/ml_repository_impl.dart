import 'dart:io';

import 'package:fpdart/fpdart.dart';

import '../../domain/enums/enums.dart';
import '../../domain/models/models.dart';
import '../../domain/repositories/repositories.dart';
import '../datasources/datasources.dart';

class MlRepositoryImpl implements MlRepository {
  final MlRemoteDatasource _remoteDatasource;
  MlRepositoryImpl(this._remoteDatasource);

  @override
  Future<Either<String, PredictionResult>> predict(File image) async {
    try {
      final result = await _remoteDatasource.predict(image);
      if (!result.contains('inedible')) {
        return Right(PredictionResult(
          status: PredictionStatus.edible,
          result: 'Makanan ini Layak',
          explanation: 'Makanan ini layak untuk dimakan',
        ));
      } else {
        return Right(PredictionResult(
          status: PredictionStatus.inedible,
          result: 'Makanan ini Tidak Layak',
          explanation: 'Maaf\nMakanan ini sudah tidak layak untuk dimakan',
        ));
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
