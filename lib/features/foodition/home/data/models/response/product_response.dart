// To parse this JSON data, do
//
//     final productResponse = productResponseFromJson(jsonString);

import 'dart:convert';

import '../../../../../../core/core.dart';
import '../../../domain/models/models.dart';

List<ProductResponse> productResponseFromJson(String str) =>
    List<ProductResponse>.from(
        json.decode(str).map((x) => ProductResponse.fromJson(x)));

String productResponseToJson(List<ProductResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductResponse {
  final String? productId;
  final String? image;
  final bool active;
  final bool status;
  final bool type;
  final int? porsi;
  final int? harga;
  final List<String>? kategori;
  final String? restoId;
  final String? namaRestoran;
  final String? lokasi;
  final bool isFavorite;
  final String? rating;

  ProductResponse({
    this.productId,
    this.image,
    this.active = false,
    this.status = false,
    this.type = false,
    this.porsi,
    this.harga,
    this.kategori,
    this.restoId,
    this.namaRestoran,
    this.lokasi,
    this.isFavorite = false,
    this.rating,
  });

  ProductModel toDomain() {
    final price = harga ?? 0;
    return ProductModel(
      id: productId ?? '',
      name: namaRestoran ?? '',
      imageUrl: image ?? '',
      categories: kategori ?? [],
      address: lokasi ?? '',
      rate: double.tryParse(rating ?? '') ?? 0,
      isFavourite: isFavorite,
      stock: porsi ?? 0,
      price: price,
      description:
          'Makanan ini ${status ? 'layak' : 'tidak layak'} untuk dimakan dan ini ${type ? 'cuma seharga ${price.currencyFormatRp}' : 'gratis untuk kamu'}.',
      prices: type ? [price, price + 5000, price + 10000, price + 30000] : [],
      isPaid: type,
      paymentCategories: [
        PaymentCategory(
          name: 'Default',
          restaurant: 0.33,
          foodition: 0.33,
          donation: 0.34,
        ),
        PaymentCategory(
          name: 'Extra untuk Restoran',
          restaurant: 0.50,
          foodition: 0.25,
          donation: 0.25,
        ),
        PaymentCategory(
          name: 'Extra untuk Foodition',
          restaurant: 0.25,
          foodition: 0.50,
          donation: 0.25,
        ),
        PaymentCategory(
          name: 'Extra untuk Donasi',
          restaurant: 0.25,
          foodition: 0.25,
          donation: 0.50,
        ),
      ],
    );
  }

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      ProductResponse(
        productId: json['productID'],
        image: json['image'],
        active: json['active'],
        status: json['status'],
        type: json['type'],
        porsi: json['porsi'],
        harga: json['harga'],
        kategori: json['kategori'] == null
            ? []
            : List<String>.from(json['kategori']!.map((x) => x)),
        restoId: json['restoID'],
        namaRestoran: json['namaRestoran'],
        lokasi: json['lokasi'],
        isFavorite: json['isFavorite'],
        rating: json['rating'],
      );

  Map<String, dynamic> toJson() => {
        'productID': productId,
        'image': image,
        'active': active,
        'status': status,
        'type': type,
        'porsi': porsi,
        'harga': harga,
        'kategori':
            kategori == null ? [] : List<dynamic>.from(kategori!.map((x) => x)),
        'restoID': restoId,
        'namaRestoran': namaRestoran,
        'lokasi': lokasi,
        'isFavorite': isFavorite,
        'rating': rating,
      };
}
