class RestoRequest {
  final String name;
  final String username;
  final String phoneNumber;
  final String slogan;
  final String description;

  RestoRequest({
    required this.name,
    required this.username,
    required this.phoneNumber,
    required this.slogan,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'nama': name,
      'username': username,
      'noHp': phoneNumber,
      'slogan': slogan,
      'deskripsi': description,
    };
  }
}
