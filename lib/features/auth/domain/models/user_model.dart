import '../../../../core/core.dart';

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
  final String address;

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
    this.address = 'Indonesia',
  });

  String? get birthdateFormat => birthdate?.toFormattedDatetime();

  @override
  String toString() {
    return 'UserModel(imageUrl: $imageUrl, name: $name, username: $username, bio: $bio, userId: $userId, email: $email, phoneNumber: $phoneNumber, gender: $gender, birthdate: $birthdate)';
  }
}
