class ErrorModel {
  final String status;
  final String message;
  final Map<String, dynamic>? data;
  final int? statusCode;

  ErrorModel({
    required this.status,
    required this.message,
    this.statusCode,
    this.data,
  });
}
