class PaymentCategory {
  final String name;
  final double restaurant;
  final double foodition;
  final double donation;

  PaymentCategory({
    required this.name,
    required this.restaurant,
    required this.foodition,
    required this.donation,
  });

  String get restaurantPercent => '${restaurant * 100}%';
  String get fooditionPercent => '${foodition * 100}%';
  String get donationPercent => '${donation * 100}%';
}
