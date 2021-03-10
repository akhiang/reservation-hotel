part of 'package:dangau_hotel/models/models.dart';

class LoginResponse {
  final String accessToken;
  final String tokenType;
  final int expiresIn;
  final Guest guest;

  LoginResponse({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.guest,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      accessToken: json['access_token'],
      tokenType: json['token_type'],
      expiresIn: json['expires_in'],
      guest: Guest.fromJson(json['guest']),
    );
  }
}
