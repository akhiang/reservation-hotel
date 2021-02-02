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
    imageUrl:
        'https://images.pexels.com/photos/258154/pexels-photo-258154.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
  ),
  Hotel(
    name: 'Dangau Resort',
    imageUrl:
        'https://images.pexels.com/photos/3155666/pexels-photo-3155666.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
  ),
  Hotel(
    name: 'Dangau Hotel',
    imageUrl:
        'https://images.pexels.com/photos/261101/pexels-photo-261101.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
  ),
];
