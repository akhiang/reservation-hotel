part of 'package:dangau_hotel/models/models.dart';

class LoginRequest {
  final String number;
  final String password;

  LoginRequest({
    @required this.number,
    @required this.password,
  });

  Map<String, String> toJson() {
    return {
      "number": number,
      "password": password,
    };
  }
}
