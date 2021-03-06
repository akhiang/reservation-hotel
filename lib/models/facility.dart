part of 'package:dangau_hotel/models/models.dart';

class Facility extends Equatable {
  final int id;
  final String name;

  Facility({
    this.id,
    this.name,
  });

  factory Facility.fromJson(Map<String, dynamic> json) {
    return Facility(
      id: json['id'],
      name: json['name'],
    );
  }

  @override
  List<Object> get props => [id, name];

  @override
  String toString() => 'Facility { name: $name }';
}
