import 'dart:io';

import 'package:dio/dio.dart';

class ProductRequest {
  final File image;
  final bool status;
  final bool type;
  final int portion;
  final String category;

  ProductRequest({
    required this.image,
    required this.status,
    required this.type,
    required this.portion,
    required this.category,
  });

  Future<FormData> toFormData() async {
    return FormData.fromMap({
      'image': await MultipartFile.fromFile(
        image.path,
        filename: 'photo-resto.jpg',
      ),
      'status': status,
      'type': type,
      'porsi': portion,
      'kategori': category,
    });
  }
}
