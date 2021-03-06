part of 'package:dangau_hotel/models/models.dart';

class HotelResponse {
  // List<Hotel> hotels;
  final int id;
  final double rating;
  final String description;
  final String name;
  final String address;
  final String latitude;
  final String longitude;
  final String city;
  final String phone;
  final String fax;
  final String website;
  final String facebook;
  final String instagram;
  final String email;
  final String facilitiesId;
  final String createdAt;
  final String updatedAt;
  final String imageUrl;

  HotelResponse({
    this.id,
    this.rating,
    this.description,
    this.name,
    this.address,
    this.latitude,
    this.longitude,
    this.city,
    this.phone,
    this.fax,
    this.website,
    this.facebook,
    this.instagram,
    this.email,
    this.facilitiesId,
    this.createdAt,
    this.updatedAt,
    this.imageUrl,
    // this.hotels,
  });

  factory HotelResponse.fromJson(Map<String, dynamic> json) {
    // return HotelResponse(
    //   hotels: List<Hotel>.from(
    //     json['data'].map((hotel) => Hotel.fromJson(hotel)),
    //   ),
    // );
    return HotelResponse(
      id: json['id'],
      rating: json['rating'],
      description: 'asdasd',
      name: json['name'],
      address: json['address'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      city: json['city'],
      phone: json['phone'],
      fax: json['fax'],
      website: json['website'],
      facebook: json['facebook'],
      instagram: json['instagram'],
      email: json['email'],
      facilitiesId: json['facilitiesId'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      imageUrl:
          "https://images.pexels.com/photos/258154/pexels-photo-258154.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    );
  }

  Hotel mapHotelResponseToHotel(HotelResponse hotelResponse) {
    return Hotel(
      id: hotelResponse.id,
      rating: hotelResponse.rating,
      description: hotelResponse.description,
      name: hotelResponse.name,
      address: hotelResponse.address,
      latitude: hotelResponse.latitude,
      longitude: hotelResponse.longitude,
      city: hotelResponse.city,
      phone: hotelResponse.phone,
      fax: hotelResponse.fax,
      website: hotelResponse.website,
      facebook: hotelResponse.facebook,
      instagram: hotelResponse.instagram,
      email: hotelResponse.email,
      createdAt: hotelResponse.createdAt,
      updatedAt: hotelResponse.updatedAt,
      imageUrl: hotelResponse.imageUrl,
    );
  }

  @override
  String toString() => 'Hotels = $name';
}
