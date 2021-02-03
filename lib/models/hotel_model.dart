part of 'package:dangau_hotel/models/models.dart';

class Hotel extends Equatable {
  final int id;
  final String name;
  final String imageUrl;

  Hotel({
    this.id,
    this.name,
    this.imageUrl,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
    );
  }

  @override
  List<Object> get props => [id, name, imageUrl];

  @override
  String toString() => 'Hotel { id: $id, name: $name }';
}

final List<Hotel> hotels = [
  Hotel(
    id: 1,
    name: 'Kahyangan Resort',
    imageUrl:
        'https://images.pexels.com/photos/258154/pexels-photo-258154.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
  ),
  Hotel(
    id: 2,
    name: 'Dangau Resort',
    imageUrl:
        'https://images.pexels.com/photos/3155666/pexels-photo-3155666.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
  ),
  Hotel(
    id: 3,
    name: 'Dangau Hotel',
    imageUrl:
        'https://images.pexels.com/photos/261101/pexels-photo-261101.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
  ),
];
