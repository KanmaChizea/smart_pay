class NetworkResponse<T> {
  final bool status;
  final String message;
  final T data;
  NetworkResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory NetworkResponse.fromMap(Map<String, dynamic> map, T data) {
    return NetworkResponse<T>(
      status: map['status'] as bool,
      message: map['message'] as String,
      data: data,
    );
  }
}
