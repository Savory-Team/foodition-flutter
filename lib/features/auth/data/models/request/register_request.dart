class RegisterRequest {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  RegisterRequest({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toMap() {
    return {
      'nama': name,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
    };
  }
}
