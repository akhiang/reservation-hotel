part of 'package:dangau_hotel/models/models.dart';

class RegisterRequest {
  final String address;
  final String number;
  final String password;

  RegisterRequest({
    @required this.address,
    @required this.number,
    @required this.password,
  });

  Map<String, String> toJson() {
    return {
      "address": address,
      "number": number,
      "password": password,
    };
  }
}
