// To parse this JSON data, do
//
//     final transactionResponse = transactionResponseFromJson(jsonString);

import 'dart:convert';

import '../../../domain/enums/enums.dart';
import '../../../domain/models/models.dart';

List<TransactionResponse> transactionResponseFromJson(String str) =>
    List<TransactionResponse>.from(
        json.decode(str).map((x) => TransactionResponse.fromJson(x)));

String transactionResponseToJson(List<TransactionResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TransactionResponse {
  final String? transactionId;
  final String? namaRestoran;
  final String? image;
  final int? price;
  final String? tanggal;
  final String? status;
  final String? alamatRestoran;
  final bool? ulas;

  TransactionResponse({
    this.transactionId,
    this.namaRestoran,
    this.image,
    this.price,
    this.tanggal,
    this.status,
    this.alamatRestoran,
    this.ulas,
  });

  HistoryModel toDomain() {
    return HistoryModel(
      id: transactionId ?? '-',
      name: namaRestoran ?? '-',
      price: price ?? 0,
      storeName: namaRestoran ?? '-',
      storeAddress: alamatRestoran ?? '-',
      imageUrl: image ?? '-',
      dateFormat: tanggal ?? '-',
      status: HistoryStatus.fromStatus(status ?? '-'),
    );
  }

  factory TransactionResponse.fromJson(Map<String, dynamic> json) =>
      TransactionResponse(
        transactionId: json['transactionID'],
        namaRestoran: json['namaRestoran'],
        image: json['image'],
        price: json['price'],
        tanggal: json['tanggal'],
        status: json['status'],
        alamatRestoran: json['alamatRestoran'],
        ulas: json['ulas'],
      );

  Map<String, dynamic> toJson() => {
        'transactionID': transactionId,
        'namaRestoran': namaRestoran,
        'image': image,
        'price': price,
        'tanggal': tanggal,
        'status': status,
        'alamatRestoran': alamatRestoran,
        'ulas': ulas,
      };
}
