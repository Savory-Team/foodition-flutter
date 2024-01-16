class PasswordRequest {
  final String oldPass;
  final String newPass;
  final String confirmNewPass;

  PasswordRequest({
    required this.oldPass,
    required this.newPass,
    required this.confirmNewPass,
  });

  Map<String, dynamic> toMap() {
    return {
      'oldPassword': oldPass,
      'newPassword': newPass,
      'confirmNewPassword': confirmNewPass,
    };
  }
}
