class AddressRequest {
  final String labelAddress;
  final String country;
  final String province;
  final String city;
  final String subdistrict;
  final String village;
  final String address;

  AddressRequest({
    required this.labelAddress,
    required this.country,
    required this.province,
    required this.city,
    required this.subdistrict,
    required this.village,
    required this.address,
  });

  Map<String, dynamic> toMap() {
    return {
      'labelAlamat': labelAddress,
      'negara': country,
      'provinsi': province,
      'kotaKab': city,
      'kecamatan': subdistrict,
      'kelurahan': village,
      'alamatLengkap': address,
    };
  }
}
