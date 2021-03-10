part of 'package:dangau_hotel/models/models.dart';

class Guest {
  final int id;
  final String name;
  final String birth;
  final String address;
  final String email;
  final String phone;
  final int isVerified;
  final String createdAt;
  final String updatedAt;

  Guest({
    this.id,
    this.name,
    this.birth,
    this.address,
    this.email,
    this.phone,
    this.isVerified,
    this.createdAt,
    this.updatedAt,
  });

  factory Guest.fromJson(Map<String, dynamic> json) {
    return Guest(
      id: json['id'],
      name: json['name'] ?? '',
      birth: json['birth'],
      address: json['address'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      isVerified: json['isVerified'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
