import '../../../../../core/core.dart';

class MenuModel {
  final bool active;
  final String status;
  final String name;
  final int price;
  final int stock;
  final String category;
  final String type;
  final String imageUrl;

  MenuModel({
    required this.active,
    required this.status,
    required this.price,
    required this.name,
    required this.stock,
    required this.category,
    required this.type,
    required this.imageUrl,
  });

  String get priceFormat => price.currencyFormatRp;
}
