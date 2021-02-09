part of 'package:dangau_hotel/models/models.dart';

class Room extends Equatable {
  final int id;
  final String name;
  final String variant;
  final String description;
  final String imageUrl;
  final int guest;
  final int available;
  final int price;
  final List<Facility> facilities;

  Room({
    this.id,
    this.name,
    this.variant,
    this.description,
    this.imageUrl,
    this.guest,
    this.available,
    this.price,
    this.facilities,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'],
      name: json['name'] ?? '',
      variant: json['variant'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'],
      guest: json['guest'] ?? 0,
      available: json['available'],
      price: json['price'] ?? 0,
      facilities: List<Facility>.from(
          json['facilities'].map((facility) => Facility.fromJson(facility))),
    );
  }

  @override
  List<Object> get props =>
      [id, name, variant, description, imageUrl, guest, available, price];

  @override
  String toString() => 'Room { name: $name, variant: $variant }';
}

final List<Room> rooms = [
  Room(
      name: 'Deluxe King',
      variant: 'With Balcony',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Blandit volutpat, ut semper congue sem at viverra. Sollicitudin proin ultrices ipsum amet.',
      price: 700000,
      available: 20,
      imageUrl:
          'https://images.pexels.com/photos/164595/pexels-photo-164595.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
  Room(
      name: 'Deluxe Twin',
      variant: 'With Balcony',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Blandit volutpat, ut semper congue sem at viverra. Sollicitudin proin ultrices ipsum amet.',
      price: 700000,
      available: 20,
      imageUrl:
          'https://images.pexels.com/photos/237371/pexels-photo-237371.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
];
