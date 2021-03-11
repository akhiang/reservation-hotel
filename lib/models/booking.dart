part of 'package:dangau_hotel/models/models.dart';

class Booking extends Equatable {
  final int id;
  final int hotelId;
  final int userId;
  final int guestId;
  final int guestFamiliesId;
  final String bookingDate;
  final String checkIn;
  final String checkOut;
  final String note;
  final String bookingStatus;
  final String createdAt;
  final String updatedAt;
  final List<BookingDetail> bookingDetails;

  Booking({
    this.id,
    this.hotelId,
    this.userId,
    this.guestId,
    this.guestFamiliesId,
    this.bookingDate,
    this.checkIn,
    this.checkOut,
    this.note,
    this.bookingStatus,
    this.createdAt,
    this.updatedAt,
    this.bookingDetails,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'],
      hotelId: json['hotel_id'],
      userId: json['user_id'],
      guestId: json['guest_id'],
      guestFamiliesId: json['guest_families_id'],
      bookingDate: json['booking_date'],
      checkIn: json['check_in'],
      checkOut: json['check_out'],
      note: json['note'],
      bookingStatus: json['booking_status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      bookingDetails: List<BookingDetail>.from(json['booking_detail']
          .map((details) => BookingDetail.fromJson(details))),
    );
  }

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'Booking(id: $id, hotelId: $hotelId, userId: $userId, guestId: $guestId, guestFamiliesId: $guestFamiliesId, bookingDate: $bookingDate, checkIn: $checkIn, checkOut: $checkOut, note: $note, bookingStatus: $bookingStatus, createdAt: $createdAt, updatedAt: $updatedAt, bookingDetail: $bookingDetails)';
  }
}
