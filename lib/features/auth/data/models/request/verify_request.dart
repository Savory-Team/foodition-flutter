class VerifyRequest {
  final String email;
  final int otp;

  VerifyRequest({
    required this.email,
    required this.otp,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'otp': '$otp',
    };
  }
}
