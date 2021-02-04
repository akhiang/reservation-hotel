part of 'package:dangau_hotel/models/models.dart';

class Facility extends Equatable {
  final String name;

  Facility({this.name});

  factory Facility.fromJson(Map<String, dynamic> json) {
    return Facility(
      name: json['name'],
    );
  }

  @override
  List<Object> get props => [name];

  @override
  String toString() => 'Facility { name: $name }';
}
