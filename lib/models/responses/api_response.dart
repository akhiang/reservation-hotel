part of 'package:dangau_hotel/models/models.dart';

class ApiResponse<T> {
  String message;
  T data;

  ApiResponse({
    this.message,
    this.data,
  });

  @override
  String toString() {
    return "Message : $message \nData : $data";
  }
}
