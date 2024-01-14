import 'package:fpdart/fpdart.dart';

import '../../../../core/db/user_db.dart';
import '../../domain/models/user_model.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/datasources.dart';
import '../models/models.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource _remoteDatasource;
  final UserDB _userDB;
  AuthRepositoryImpl(this._remoteDatasource, this._userDB);

  @override
  Future<Either<String, bool>> login(LoginRequest request) async {
    try {
      final result = await _remoteDatasource.login(request);
      await _userDB.saveToken(result);
      return const Right(true);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, bool>> register(RegisterRequest request) async {
    try {
      final result = await _remoteDatasource.register(request);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, UserModel>> show() async {
    try {
      final token = await _userDB.loadToken();
      final result = await _remoteDatasource.show(token);
      return Right(result.data.toDomain());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, bool>> verify(VerifyRequest request) async {
    try {
      final result = await _remoteDatasource.verify(request);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, bool>> logout() async {
    try {
      await _userDB.removeToken();
      return const Right(true);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
