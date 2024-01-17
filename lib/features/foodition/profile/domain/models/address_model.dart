class AddressModel {
  final String labelAddress;
  final String country;
  final String province;
  final String city;
  final String subdistrict;
  final String village;
  final String address;
  final bool isResto;

  AddressModel({
    required this.labelAddress,
    required this.country,
    required this.province,
    required this.city,
    required this.subdistrict,
    required this.village,
    required this.address,
    this.isResto = false,
  });

  String get addressFormat => (subdistrict.isEmpty || city.isEmpty)
      ? (city.isEmpty ? 'Indonesia' : city)
      : '$subdistrict, $city';
}
