part of 'package:dangau_hotel/models/models.dart';

class Hotel extends Equatable {
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
  // final String facilitiesId;
  final String createdAt;
  final String updatedAt;
  final String imageUrl;
  final List<Food> foods;
  final List<HotelReview> reviews;

  Hotel({
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
    // this.facilitiesId,
    this.createdAt,
    this.updatedAt,
    this.imageUrl,
    this.foods,
    this.reviews,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      id: json['id'],
      rating: json['rating'],
      description: json['description'] ?? '',
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
      // facilitiesId: json['facilities_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      imageUrl:
          "https://images.pexels.com/photos/258154/pexels-photo-258154.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
      foods: json.containsKey('food')
          ? List<Food>.from(json['food'].map((food) => Food.fromJson(food)))
          : [],
      reviews: json.containsKey('hotel_review')
          ? List<HotelReview>.from(json['hotel_review']
              .map((reviews) => HotelReview.fromJson(reviews)))
          : [],
    );
  }

  @override
  List<Object> get props => [];

  @override
  String toString() => 'Hotel { id: $id, name: $name, foods: $foods }';
}
