import 'dart:io';

import 'package:fpdart/fpdart.dart';

import '../../data/models/request/requests.dart';
import '../models/resto_model.dart';

abstract class RestoRepository {
  Future<Either<String, RestoModel>> getMyResto();
  Future<Either<String, bool>> editResto(RestoRequest request);
  Future<Either<String, bool>> editAddress(AddressRequest request);
  Future<Either<String, bool>> editPhotoResto(File image);
}
