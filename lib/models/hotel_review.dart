part of 'package:dangau_hotel/models/models.dart';

class HotelReview extends Equatable {
  final int id;
  final int hotelId;
  final int userId;
  final int guestId;
  final int bookingId;
  final int rating;
  final String comment;
  final bool isPublish;
  final String createdAt;
  final String updatedAt;
  final Guest guest;

  HotelReview({
    this.id,
    this.hotelId,
    this.userId,
    this.guestId,
    this.bookingId,
    this.rating,
    this.comment,
    this.isPublish,
    this.createdAt,
    this.updatedAt,
    this.guest,
  });

  factory HotelReview.fromJson(Map<String, dynamic> json) {
    return HotelReview(
      id: json['id'],
      hotelId: json['hotel_id'],
      userId: json['user_id'],
      guestId: json['guest_id'],
      bookingId: json['booking_id'],
      rating: json['rating'] ?? 0,
      comment: json['comment'] ?? '',
      isPublish: json['is_publish'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      guest: Guest.fromJson(json['guest']),
    );
  }

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'HotelReview(id: $id, hotelId: $hotelId, userId: $userId, guestId: $guestId, bookingId: $bookingId, rating: $rating, comment: $comment, isPublish: $isPublish, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
