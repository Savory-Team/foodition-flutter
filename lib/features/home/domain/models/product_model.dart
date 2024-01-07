import '../../../../core/core.dart';
import '../enums/enums.dart';
import 'models.dart';

class ProductModel {
  final String name;
  final String imageUrl;
  final List<String> categories;
  final String address;
  final String city;
  final double rate;
  final bool isFavourite;
  final int stock;
  final int price;
  final String description;
  final List<int> prices;
  final List<PaymentCategory> paymentCategories;
  final PaymentMethod paymentMethod;
  final PickUpMethod pickUpMethod;

  ProductModel({
    required this.name,
    required this.imageUrl,
    required this.categories,
    required this.address,
    required this.city,
    required this.rate,
    required this.isFavourite,
    required this.stock,
    required this.price,
    required this.description,
    required this.prices,
    required this.paymentCategories,
    this.paymentMethod = PaymentMethod.cod,
    this.pickUpMethod = PickUpMethod.self,
  });

  String get priceFormat => price.currencyFormatRp;
  List<String> get pricesFormat =>
      prices.map((e) => e.currencyFormatRp).toList();
}
