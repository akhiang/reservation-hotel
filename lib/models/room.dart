part of 'package:dangau_hotel/models/models.dart';

class Room {
  String name;
  String variant;
  String description;
  int price;
  int capacity;
  String imageUrl;

  Room({
    this.name,
    this.variant,
    this.description,
    this.price,
    this.capacity,
    this.imageUrl,
  });
}

final List<Room> rooms = [
  Room(
      name: 'Deluxe King',
      variant: 'With Balcony',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Blandit volutpat, ut semper congue sem at viverra. Sollicitudin proin ultrices ipsum amet.',
      price: 700000,
      capacity: 20,
      imageUrl:
          'https://images.pexels.com/photos/164595/pexels-photo-164595.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
  Room(
      name: 'Deluxe Twin',
      variant: 'With Balcony',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Blandit volutpat, ut semper congue sem at viverra. Sollicitudin proin ultrices ipsum amet.',
      price: 700000,
      capacity: 20,
      imageUrl:
          'https://images.pexels.com/photos/237371/pexels-photo-237371.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
];
