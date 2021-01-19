part of 'package:dangau_hotel/models/models.dart';

class Hotel {
  String name;
  String imageUrl;

  Hotel({
    this.name,
    this.imageUrl,
  });
}

final List<Hotel> hotels = [
  Hotel(
    name: 'Kahyangan Resort',
    imageUrl: 'assets/images/pexels-pixabay-258154.jpg',
  ),
  Hotel(
    name: 'Dangau Resort',
    imageUrl: 'assets/images/pexels-pixabay-258154.jpg',
  ),
  Hotel(
    name: 'Dangau Hotel',
    imageUrl: 'assets/images/pexels-pixabay-258154.jpg',
  ),
];
