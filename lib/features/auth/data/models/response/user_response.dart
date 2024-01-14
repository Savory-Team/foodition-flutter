// To parse this JSON data, do
//
//     final userResponse = userResponseFromJson(jsonString);

import 'dart:convert';

import '../../../domain/models/user_model.dart';

UserResponse userResponseFromJson(String str) =>
    UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
  final String? image;
  final String? nama;
  final String? username;
  final String? bio;
  final String? userId;
  final String? email;
  final String? noHp;
  final String? jenisKelamin;
  final String? tanggalLahir;

  UserResponse({
    this.image,
    this.nama,
    this.username,
    this.bio,
    this.userId,
    this.email,
    this.noHp,
    this.jenisKelamin,
    this.tanggalLahir,
  });

  UserModel toDomain() => UserModel(
        imageUrl: image ??
            'https://storage.googleapis.com/savory/api-service/user/default-user-image.png',
        name: nama ?? '',
        username: username,
        bio: bio,
        userId: userId ?? '',
        email: email ?? '',
        phoneNumber: noHp,
        gender: jenisKelamin,
        birthdate: DateTime.tryParse(tanggalLahir ?? ''),
      );

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        image: json['image'],
        nama: json['nama'],
        username: json['username'],
        bio: json['bio'],
        userId: json['userID'],
        email: json['email'],
        noHp: json['noHp'],
        jenisKelamin: json['jenisKelamin'],
        tanggalLahir: json['tanggalLahir'],
      );

  Map<String, dynamic> toJson() => {
        'image': image,
        'nama': nama,
        'username': username,
        'bio': bio,
        'userID': userId,
        'email': email,
        'noHp': noHp,
        'jenisKelamin': jenisKelamin,
        'tanggalLahir': tanggalLahir,
      };

  @override
  String toString() {
    return 'UserResponse(image: $image, nama: $nama, username: $username, bio: $bio, userId: $userId, email: $email, noHp: $noHp, jenisKelamin: $jenisKelamin, tanggalLahir: $tanggalLahir)';
  }
}
