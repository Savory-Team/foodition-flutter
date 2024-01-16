import 'dart:io';

import 'package:fpdart/fpdart.dart';

import '../../domain/models/models.dart';
import '../../domain/repositories/repositories.dart';
import '../datasources/user_remote_datasource.dart';
import '../models/request/address_request.dart';
import '../models/request/password_request.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDatasource _remoteDatasource;
  UserRepositoryImpl(this._remoteDatasource);

  @override
  Future<Either<String, UserModel>> show() async {
    try {
      final result = await _remoteDatasource.show();
      return Right(result.data.toDomain());
    } catch (e) {
      return Left(e.toString());
    }
  }

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
  Future<Either<String, bool>> editBio(String bio) async {
    try {
      final result = await _remoteDatasource.editBio(bio);
      return Right(result.data);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, bool>> editBirthdate(DateTime birthdate) async {
    try {
      final result = await _remoteDatasource.editBirthdate(birthdate);
      return Right(result.data);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, bool>> editGender(String gender) async {
    try {
      final isMale = !gender.contains('Perempuan');
      final result = await _remoteDatasource.editGender(isMale);
      return Right(result.data);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, bool>> editName(String name) async {
    try {
      final result = await _remoteDatasource.editName(name);
      return Right(result.data);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, bool>> editPassword(PasswordRequest request) async {
    try {
      final result = await _remoteDatasource.editPassword(request);
      return Right(result.data);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, bool>> editPhoneNumber(String phoneNumber) async {
    try {
      final result = await _remoteDatasource.editPhoneNumber(phoneNumber);
      return Right(result.data);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, bool>> editPhotoProfile(File image) async {
    try {
      final result = await _remoteDatasource.editPhotoProfile(image);
      return Right(result.data);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, bool>> editUsername(String username) async {
    try {
      final result = await _remoteDatasource.editUsername(username);
      return Right(result.data);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
