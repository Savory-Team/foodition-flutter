import 'package:fpdart/fpdart.dart';

import '../../data/models/request/requests.dart';

abstract class AuthRepository {
  Future<Either<String, bool>> login(LoginRequest request);
  Future<Either<String, bool>> register(RegisterRequest request);
  Future<Either<String, bool>> verify(VerifyRequest request);
  Future<Either<String, bool>> reSendOtp(String email);
  Future<Either<String, bool>> logout();
}
