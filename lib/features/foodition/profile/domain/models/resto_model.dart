import 'address_model.dart';

class RestoModel {
  final String imageUrl;
  final String name;
  final String username;
  final String slogan;
  final String userId;
  final String restoId;
  final int totalProduct;
  final String phoneNumber;
  final String description;
  final AddressModel address;
  final double rate;

  RestoModel({
    required this.imageUrl,
    required this.name,
    required this.username,
    required this.slogan,
    required this.userId,
    required this.restoId,
    required this.totalProduct,
    required this.phoneNumber,
    required this.description,
    required this.address,
    required this.rate,
  });
}
