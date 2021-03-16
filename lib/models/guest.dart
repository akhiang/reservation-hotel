part of 'package:dangau_hotel/models/models.dart';

class Guest extends Equatable {
  final int id;
  final String name;
  final String birth;
  final String address;
  final String email;
  final String phone;
  final bool isVerified;
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
      birth: json['date_of_birth'],
      address: json['address'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      isVerified: json['is_verified'] ?? false,
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'name': this.name,
      'date_of_birth': this.birth,
      'address': this.address,
      'email': this.email,
      'phone': this.phone,
      'isVerified': this.isVerified,
    };
  }

  @override
  List<Object> get props => [];

  @override
  String toString() => 'Guest { id: $id, name: $name, email: $email }';
}
