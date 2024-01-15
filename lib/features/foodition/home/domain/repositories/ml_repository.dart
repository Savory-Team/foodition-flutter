import 'dart:io';

import 'package:fpdart/fpdart.dart';

import '../models/models.dart';

abstract class MlRepository {
  Future<Either<String, PredictionResult>> predict(File image);
}
