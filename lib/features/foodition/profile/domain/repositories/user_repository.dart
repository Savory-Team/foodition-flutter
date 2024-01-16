import 'dart:io';

import 'package:fpdart/fpdart.dart';

import '../../data/models/request/requests.dart';
import '../models/models.dart';

abstract class UserRepository {
  Future<Either<String, UserModel>> show();
  Future<Either<String, bool>> editAddress(AddressRequest request);
  Future<Either<String, bool>> editPhotoProfile(File image);
  Future<Either<String, bool>> editPassword(PasswordRequest request);
  Future<Either<String, bool>> editUsername(String username);
  Future<Either<String, bool>> editName(String name);
  Future<Either<String, bool>> editBio(String bio);
  Future<Either<String, bool>> editPhoneNumber(String phoneNumber);
  Future<Either<String, bool>> editGender(String gender);
  Future<Either<String, bool>> editBirthdate(DateTime birthdate);
}
