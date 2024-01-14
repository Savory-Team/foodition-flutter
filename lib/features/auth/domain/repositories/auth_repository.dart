import 'package:fpdart/fpdart.dart';

import '../../data/models/request/requests.dart';
import '../models/models.dart';

abstract class AuthRepository {
  Future<Either<String, bool>> login(LoginRequest request);
  Future<Either<String, bool>> register(RegisterRequest request);
  Future<Either<String, bool>> verify(VerifyRequest request);
  Future<Either<String, UserModel>> show();
  Future<Either<String, bool>> logout();
}
