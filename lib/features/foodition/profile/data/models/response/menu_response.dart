// To parse this JSON data, do
//
//     final menuResponse = menuResponseFromJson(jsonString);

import 'dart:convert';

import '../../../domain/models/models.dart';

List<MenuResponse> menuResponseFromJson(String str) => List<MenuResponse>.from(
    json.decode(str).map((x) => MenuResponse.fromJson(x)));

String menuResponseToJson(List<MenuResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MenuResponse {
  final String? productId;
  final String? image;
  final bool active;
  final bool status;
  final bool type;
  final int porsi;
  final List<String>? kagetori;
  final int harga;

  MenuResponse({
    this.productId,
    this.image,
    this.active = false,
    this.status = false,
    this.type = false,
    this.porsi = 0,
    this.kagetori,
    this.harga = 0,
  });

  MenuModel toDomain() => MenuModel(
        active: active,
        status: status ? 'Aktif' : 'Tidak Aktif',
        price: harga,
        name: 'Nama Resto',
        stock: porsi,
        category: (kagetori ?? []).isEmpty ? '-' : kagetori!.first,
        type: type ? 'Berbayar' : 'Gratis',
        imageUrl: image ?? '',
      );

  factory MenuResponse.fromJson(Map<String, dynamic> json) => MenuResponse(
        productId: json['productID'],
        image: json['image'],
        active: json['active'],
        status: json['status'],
        type: json['type'],
        porsi: json['porsi'],
        kagetori: json['kagetori'] == null
            ? []
            : List<String>.from(json['kagetori']!.map((x) => x)),
        harga: json['harga'],
      );

  Map<String, dynamic> toJson() => {
        'productID': productId,
        'image': image,
        'active': active,
        'status': status,
        'type': type,
        'porsi': porsi,
        'kagetori':
            kagetori == null ? [] : List<dynamic>.from(kagetori!.map((x) => x)),
        'harga': harga,
      };
}
