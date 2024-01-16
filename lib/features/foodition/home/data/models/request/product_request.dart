import 'dart:io';

import 'package:dio/dio.dart';

class ProductRequest {
  final File image;
  final bool status;
  final bool type;
  final int portion;
  final int category;

  ProductRequest({
    required this.image,
    required this.status,
    required this.type,
    required this.portion,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    final bytes = image.readAsBytesSync();
    return {
      'image': MultipartFile.fromBytes(bytes),
      'status': status,
      'type': type,
      'porsi': portion,
      'kategori': category,
    };
  }
}
