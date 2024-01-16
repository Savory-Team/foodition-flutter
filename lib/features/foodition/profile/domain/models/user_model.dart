import '../../../../../core/core.dart';
import 'address_model.dart';

class UserModel {
  final String imageUrl;
  final String name;
  final String? username;
  final String? bio;
  final String userId;
  final String email;
  final String? phoneNumber;
  final String? gender;
  final DateTime? birthdate;
  final AddressModel address;

  UserModel({
    required this.imageUrl,
    required this.name,
    required this.username,
    required this.bio,
    required this.userId,
    required this.email,
    required this.phoneNumber,
    required this.gender,
    required this.birthdate,
    required this.address,
  });

  String? get birthdateFormat => birthdate?.toFormattedDatetime();
}
