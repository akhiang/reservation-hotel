part of 'package:dangau_hotel/models/models.dart';

class HotelRating {
  final double rating;
  final int ratingAmount;
  final int rate5;
  final int rate4;
  final int rate3;
  final int rate2;
  final int rate1;

  HotelRating({
    this.rating,
    this.ratingAmount,
    this.rate5,
    this.rate4,
    this.rate3,
    this.rate2,
    this.rate1,
  });

  Map<String, dynamic> toJson() {
    return {
      'rating': rating,
      'rating_amount': ratingAmount,
      'rate_5': rate5,
      'rate_4': rate4,
      'rate_3': rate3,
      'rate_2': rate2,
      'rate_1': rate1,
    };
  }

  factory HotelRating.fromJson(Map<String, dynamic> json) {
    return HotelRating(
      rating: json['rating'].toDouble(),
      ratingAmount: json['rating_amount'],
      rate5: json['rate_5'],
      rate4: json['rate_4'],
      rate3: json['rate_3'],
      rate2: json['rate_2'],
      rate1: json['rate_1'],
    );
  }

  @override
  String toString() =>
      'Hotel Rating { rating: $rating, amount: $ratingAmount }';
}
