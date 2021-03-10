part of 'package:dangau_hotel/models/models.dart';

class LoginRequest {
  final String number;
  final String password;

  LoginRequest({
    @required this.number,
    @required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "phone": number,
      "password": password,
    };
  }
}
