class TransactionRequest {
  final String productId;
  final int price;
  final bool type;

  TransactionRequest({
    required this.productId,
    required this.price,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'productID': productId,
      'price': price,
      'type': type,
    };
  }
}
