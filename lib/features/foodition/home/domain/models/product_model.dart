import '../../../../../core/core.dart';
import '../enums/enums.dart';
import 'models.dart';

class ProductModel {
  final String id;
  final String name;
  final String imageUrl;
  final List<String> categories;
  final String address;
  final double rate;
  final bool isFavourite;
  final int stock;
  final int price;
  final String description;
  final List<int> prices;
  final List<PaymentCategory> paymentCategories;
  final PaymentMethod paymentMethod;
  final PickUpMethod pickUpMethod;
  final bool isPaid;
  final bool isActive;
  final bool isResto;

  ProductModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.categories,
    required this.address,
    required this.rate,
    required this.isFavourite,
    required this.stock,
    required this.price,
    required this.description,
    required this.prices,
    required this.paymentCategories,
    this.paymentMethod = PaymentMethod.cod,
    this.pickUpMethod = PickUpMethod.self,
    required this.isPaid,
    required this.isActive,
    this.isResto = false,
  });

  String get priceFormat => price.currencyFormatRp;
  List<String> get pricesFormat =>
      prices.map((e) => e.currencyFormatRp).toList();
  String get status => isActive ? 'Aktif' : 'Tidak Aktif';
  bool get isFree => !isPaid;

  ProductModel copyWith({
    String? id,
    String? name,
    String? imageUrl,
    List<String>? categories,
    String? address,
    double? rate,
    bool? isFavourite,
    int? stock,
    int? price,
    String? description,
    List<int>? prices,
    List<PaymentCategory>? paymentCategories,
    PaymentMethod? paymentMethod,
    PickUpMethod? pickUpMethod,
    bool? isPaid,
    bool? isActive,
    bool? isResto,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      categories: categories ?? this.categories,
      address: address ?? this.address,
      rate: rate ?? this.rate,
      isFavourite: isFavourite ?? this.isFavourite,
      stock: stock ?? this.stock,
      price: price ?? this.price,
      description: description ?? this.description,
      prices: prices ?? this.prices,
      paymentCategories: paymentCategories ?? this.paymentCategories,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      pickUpMethod: pickUpMethod ?? this.pickUpMethod,
      isPaid: isPaid ?? this.isPaid,
      isActive: isActive ?? this.isActive,
      isResto: isResto ?? this.isResto,
    );
  }
}
