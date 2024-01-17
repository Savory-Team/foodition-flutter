import 'dart:io';

import 'package:fpdart/fpdart.dart';

import '../../domain/models/resto_model.dart';
import '../../domain/repositories/repositories.dart';
import '../datasources/resto_remote_datasource.dart';
import '../models/request/address_request.dart';
import '../models/request/resto_request.dart';

class RestoRepositoryImpl implements RestoRepository {
  final RestoRemoteDatasource _remoteDatasource;
  RestoRepositoryImpl(this._remoteDatasource);

  @override
  Future<Either<String, bool>> editAddress(AddressRequest request) async {
    try {
      final result = await _remoteDatasource.editAddress(request);
      return Right(result.data);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, bool>> editPhotoResto(File image) async {
    try {
      final result = await _remoteDatasource.editPhotoResto(image);
      return Right(result.data);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, bool>> editResto(RestoRequest request) async {
    try {
      final result = await _remoteDatasource.editResto(request);
      return Right(result.data);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, RestoModel>> getMyResto() async {
    try {
      final result = await _remoteDatasource.getMyResto();
      return Right(result.data.toDomain());
    } catch (e) {
      return Left(e.toString());
    }
  }
}
