part of 'package:dangau_hotel/models/models.dart';

class Food {
  String name;
  int price;
  int rating;
  String imageUrl;

  Food({
    this.name,
    this.price,
    this.rating,
    this.imageUrl,
  });
}

final List<Food> foods = [
  Food(
      name: 'Classic Burger',
      price: 20000,
      rating: 5,
      imageUrl:
          'https://images.pexels.com/photos/1251198/pexels-photo-1251198.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
  Food(
      name: 'Chiz Linguini',
      price: 20000,
      rating: 5,
      imageUrl:
          'https://images.pexels.com/photos/41194/beef-cheese-cuisine-delicious-41194.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
  Food(
      name: 'Pounder Pizza',
      price: 20000,
      rating: 5,
      imageUrl:
          'https://images.pexels.com/photos/708587/pexels-photo-708587.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
  Food(
      name: 'Beef Steak',
      price: 20000,
      rating: 5,
      imageUrl:
          'https://images.pexels.com/photos/769289/pexels-photo-769289.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
  Food(
      name: 'Sushi Platter',
      price: 20000,
      rating: 5,
      imageUrl:
          'https://images.pexels.com/photos/2098085/pexels-photo-2098085.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
];
