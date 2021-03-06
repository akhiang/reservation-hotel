part of 'package:dangau_hotel/models/models.dart';

class Food extends Equatable {
  final int id;
  final String name;
  final int price;
  final String imageUrl;
  final String description;
  final int rating;
  final String createdAt;
  final String updatedAt;

  Food({
    this.id,
    this.name,
    this.price,
    this.imageUrl,
    this.description,
    this.rating,
    this.createdAt,
    this.updatedAt,
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      imageUrl:
          'https://images.pexels.com/photos/41194/beef-cheese-cuisine-delicious-41194.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      description: json['description'],
      rating: json['rating'],
      createdAt: json['create_at'],
      updatedAt: json['updated_at'],
    );
  }

  @override
  List<Object> get props => [];

  @override
  String toString() => 'Food { id: $id, name: $name, rating: $rating }';
}

final List<Food> foods = [
  Food(
      name: 'Classic Burger',
      description: 'Lorem Ipsum Dolor Sit Amet',
      price: 20000,
      rating: 5,
      imageUrl:
          'https://images.pexels.com/photos/1251198/pexels-photo-1251198.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
  Food(
      name: 'Chiz Linguini',
      description: 'Lorem Ipsum Dolor Sit Amet',
      price: 20000,
      rating: 5,
      imageUrl:
          'https://images.pexels.com/photos/41194/beef-cheese-cuisine-delicious-41194.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
  Food(
      name: 'Pounder Pizza',
      description: 'Lorem Ipsum Dolor Sit Amet',
      price: 20000,
      rating: 5,
      imageUrl:
          'https://images.pexels.com/photos/708587/pexels-photo-708587.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
  Food(
      name: 'Beef Steak',
      description: 'Lorem Ipsum Dolor Sit Amet',
      price: 20000,
      rating: 5,
      imageUrl:
          'https://images.pexels.com/photos/769289/pexels-photo-769289.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
  Food(
      name: 'Sushi Platter',
      description: 'Lorem Ipsum Dolor Sit Amet',
      price: 20000,
      rating: 5,
      imageUrl:
          'https://images.pexels.com/photos/2098085/pexels-photo-2098085.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
];
