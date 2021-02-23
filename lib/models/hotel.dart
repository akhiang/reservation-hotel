part of 'package:dangau_hotel/models/models.dart';

class Hotel extends Equatable {
  final int id;
  final String name;
  final double rating;
  final String description;
  final String imageUrl;
  final List<Facility> facilities;
  // final List<Room> rooms;

  Hotel({
    this.id,
    this.name,
    this.rating,
    this.description,
    this.imageUrl,
    this.facilities,
    // this.rooms,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      id: json['id'],
      name: json['name'],
      rating: json['rating'].toDouble(),
      description: json['description'],
      imageUrl: json['imageUrl'],
      facilities: List<Facility>.from(
          json['facilities'].map((facility) => Facility.fromJson(facility))),
      // rooms: List<Room>.from(json['rooms'].map((room) => Room.fromJson(room))),
    );
  }

  @override
  List<Object> get props =>
      [id, name, rating, description, imageUrl, facilities];

  @override
  String toString() => 'Hotel { id: $id, name: $name, rating: $rating }';
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
