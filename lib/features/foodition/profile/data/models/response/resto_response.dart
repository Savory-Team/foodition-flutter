// To parse this JSON data, do
//
//     final restoResponse = restoResponseFromJson(jsonString);

import 'dart:convert';

import '../../../../foodition.dart';

RestoResponse restoResponseFromJson(String str) =>
    RestoResponse.fromJson(json.decode(str));

String restoResponseToJson(RestoResponse data) => json.encode(data.toJson());

class RestoResponse {
  final String? restoId;
  final String? userId;
  final String? image;
  final String? nama;
  final String? noHp;
  final String? slogan;
  final int? totalProduct;
  final String? username;
  final String? deskripsi;
  final String? labelAlamat;
  final String? negara;
  final String? provinsi;
  final String? kotaKab;
  final String? kecamatan;
  final String? kelurahan;
  final String? alamatLengkap;
  final String? rating;

  RestoResponse({
    this.restoId,
    this.userId,
    this.image,
    this.nama,
    this.noHp,
    this.slogan,
    this.totalProduct,
    this.username,
    this.deskripsi,
    this.labelAlamat,
    this.negara,
    this.provinsi,
    this.kotaKab,
    this.kecamatan,
    this.kelurahan,
    this.alamatLengkap,
    this.rating,
  });

  RestoModel toDomain() => RestoModel(
        imageUrl: image ?? '',
        name: nama ?? '',
        username: username ?? '',
        slogan: slogan ?? '',
        restoId: restoId ?? '',
        userId: userId ?? '',
        phoneNumber: noHp ?? '',
        totalProduct: totalProduct ?? 0,
        description: deskripsi ?? '',
        address: AddressModel(
          labelAddress: labelAlamat ?? '',
          country: negara ?? '',
          province: provinsi ?? '',
          city: kotaKab ?? '',
          subdistrict: kecamatan ?? '',
          village: kelurahan ?? '',
          address: alamatLengkap ?? '',
          isResto: true,
        ),
        rate: double.tryParse(rating ?? '') ?? 0,
      );

  factory RestoResponse.fromJson(Map<String, dynamic> json) => RestoResponse(
        restoId: json['restoID'],
        userId: json['userID'],
        image: json['image'],
        nama: json['nama'],
        noHp: json['noHp'],
        slogan: json['slogan'],
        totalProduct: json['totalProduct'],
        username: json['username'],
        deskripsi: json['deskripsi'],
        labelAlamat: json['labelAlamat'],
        negara: json['negara'],
        provinsi: json['provinsi'],
        kotaKab: json['kotaKab'],
        kecamatan: json['kecamatan'],
        kelurahan: json['kelurahan'],
        alamatLengkap: json['alamatLengkap'],
        rating: json['rating'],
      );

  Map<String, dynamic> toJson() => {
        'restoID': restoId,
        'userID': userId,
        'image': image,
        'nama': nama,
        'noHp': noHp,
        'slogan': slogan,
        'totalProduct': totalProduct,
        'username': username,
        'deskripsi': deskripsi,
        'labelAlamat': labelAlamat,
        'negara': negara,
        'provinsi': provinsi,
        'kotaKab': kotaKab,
        'kecamatan': kecamatan,
        'kelurahan': kelurahan,
        'alamatLengkap': alamatLengkap,
        'rating': rating,
      };
}
