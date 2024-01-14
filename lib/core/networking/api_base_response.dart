class ApiBaseResponse<T> {
  final bool error;
  final String message;
  final T data;

  ApiBaseResponse(
      {required this.error, required this.message, required this.data});

  factory ApiBaseResponse.fromJson(
      Map<String, dynamic> json, T Function(dynamic json) fromJsonData) {
    return ApiBaseResponse(
      error: json['error'] ?? false,
      message: json['message'] ?? '',
      data: fromJsonData(json['data']),
    );
  }

  @override
  String toString() =>
      'ApiBaseResponse(error: $error, message: $message, data: $data)';
}
