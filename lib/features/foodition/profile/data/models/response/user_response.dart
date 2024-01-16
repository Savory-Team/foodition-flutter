// To parse this JSON data, do
//
//     final userResponse = userResponseFromJson(jsonString);

import 'dart:convert';

import '../../../domain/models/models.dart';

UserResponse userResponseFromJson(String str) =>
    UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
  final String? userId;
  final String? nama;
  final String? email;
  final String? image;
  final String? username;
  final dynamic bio;
  final String? noHp;
  final String? jenisKelamin;
  final String? tanggalLahir;
  final String? labelAlamat;
  final String? negara;
  final String? provinsi;
  final String? kotaKab;
  final String? kecamatan;
  final String? kelurahan;
  final String? alamatLengkap;

  UserResponse({
    this.userId,
    this.nama,
    this.email,
    this.image,
    this.username,
    this.bio,
    this.noHp,
    this.jenisKelamin,
    this.tanggalLahir,
    this.labelAlamat,
    this.negara,
    this.provinsi,
    this.kotaKab,
    this.kecamatan,
    this.kelurahan,
    this.alamatLengkap,
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
        address: AddressModel(
          labelAddress: labelAlamat ?? '',
          country: negara ?? '',
          province: provinsi ?? ';',
          city: kotaKab ?? '',
          subdistrict: kecamatan ?? '',
          village: kelurahan ?? '',
          address: alamatLengkap ?? '',
        ),
      );

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        userId: json['userID'],
        nama: json['nama'],
        email: json['email'],
        image: json['image'],
        username: json['username'],
        bio: json['bio'],
        noHp: json['noHp'],
        jenisKelamin: json['jenisKelamin'],
        tanggalLahir: json['tanggalLahir'],
        labelAlamat: json['labelAlamat'],
        negara: json['negara'],
        provinsi: json['provinsi'],
        kotaKab: json['kotaKab'],
        kecamatan: json['kecamatan'],
        kelurahan: json['kelurahan'],
        alamatLengkap: json['alamatLengkap'],
      );

  Map<String, dynamic> toJson() => {
        'userID': userId,
        'nama': nama,
        'email': email,
        'image': image,
        'username': username,
        'bio': bio,
        'noHp': noHp,
        'jenisKelamin': jenisKelamin,
        'tanggalLahir': tanggalLahir,
        'labelAlamat': labelAlamat,
        'negara': negara,
        'provinsi': provinsi,
        'kotaKab': kotaKab,
        'kecamatan': kecamatan,
        'kelurahan': kelurahan,
        'alamatLengkap': alamatLengkap,
      };
}
