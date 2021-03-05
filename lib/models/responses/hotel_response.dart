part of 'package:dangau_hotel/models/models.dart';

class HotelResponse {
  List<Hotel> hotels;

  HotelResponse({this.hotels});

  factory HotelResponse.fromJson(Map<String, dynamic> json) {
    return HotelResponse(
      hotels: List<Hotel>.from(
        json['data'].map((hotel) => Hotel.fromJson(hotel)),
      ),
    );
  }

  @override
  String toString() => 'Hotels = $hotels';
}
