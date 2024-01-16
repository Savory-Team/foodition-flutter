import '../../../../../core/extensions/extensions.dart';
import '../enums/enums.dart';

class HistoryModel {
  final String id;
  final String name;
  final int price;
  final String storeName;
  final String storeAddress;
  final String imageUrl;
  final String dateFormat;
  final HistoryStatus status;
  final double? rate;

  HistoryModel({
    required this.id,
    required this.name,
    required this.price,
    required this.storeName,
    required this.storeAddress,
    required this.imageUrl,
    required this.dateFormat,
    required this.status,
    this.rate,
  });

  bool get isNotRate => rate == null && status.isDone;
  String get priceFormat => price.currencyFormatRp;
}
