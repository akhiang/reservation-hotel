part of 'package:dangau_hotel/models/models.dart';

class RoomType extends Equatable {
  final int id;
  final String name;
  final String variant;
  final int price;
  // final List<Facility> facilities;
  final String description;
  final int personCapacity;
  final String createdAt;
  final String updatedAt;
  final bool isAvailable;
  final int available;
  final String imageUrl;

  RoomType({
    this.id,
    this.name,
    this.variant,
    this.price,
    // this.facilities,
    this.description,
    this.personCapacity,
    this.createdAt,
    this.updatedAt,
    this.isAvailable,
    this.available,
    this.imageUrl,
  });

  factory RoomType.fromJson(Map<String, dynamic> json) {
    return RoomType(
      id: json['id'],
      name: json['name'] ?? '',
      variant: json['variant'] ?? '',
      price: json['price'] ?? 0,
      description: json['description'] ?? '',
      personCapacity: json['person_capacity'] ?? 0,
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      isAvailable: json['is_room_available'],
      available: json['room_available'],
      imageUrl:
          'https://images.pexels.com/photos/164595/pexels-photo-164595.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      // facilities: List<Facility>.from(
      //     json['facilities'].map((facility) => Facility.fromJson(facility))),
    );
  }

  @override
  List<Object> get props => [];

  @override
  String toString() => 'RoomType { name: $name }';
}

// final List<Room> rooms = [
//   Room(
//       name: 'Deluxe King',
//       variant: 'With Balcony',
//       description:
//           'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Blandit volutpat, ut semper congue sem at viverra. Sollicitudin proin ultrices ipsum amet.',
//       price: 700000,
//       available: 20,
//       imageUrl:
//           'https://images.pexels.com/photos/164595/pexels-photo-164595.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
//   Room(
//       name: 'Deluxe Twin',
//       variant: 'With Balcony',
//       description:
//           'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Blandit volutpat, ut semper congue sem at viverra. Sollicitudin proin ultrices ipsum amet.',
//       price: 700000,
//       available: 20,
//       imageUrl:
//           'https://images.pexels.com/photos/237371/pexels-photo-237371.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
// ];
