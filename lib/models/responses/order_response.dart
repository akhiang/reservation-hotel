part of 'package:dangau_hotel/models/models.dart';

class OrderResponse {
  final int id;
  final int hotelId;
  final int guestId;
  final String bookingDate;
  final String checkIn;
  final String checkOut;
  final String note;
  final String bookingStatus;
  final double total;
  final double tax;
  final double grandTotal;
  final String createdAt;
  final String updateddAt;
  final Hotel hotel;
  final Guest guest;
  final List<BookingDetail> bookingDetail;

  OrderResponse({
    this.id,
    this.hotelId,
    this.guestId,
    this.bookingDate,
    this.checkIn,
    this.checkOut,
    this.note,
    this.bookingStatus,
    this.total,
    this.tax,
    this.grandTotal,
    this.createdAt,
    this.updateddAt,
    this.hotel,
    this.guest,
    this.bookingDetail,
  });

  factory OrderResponse.fromJson(Map<String, dynamic> json) {
    return OrderResponse(
      id: json['id'],
      hotelId: json['hotel_id'],
      guestId: json['guest_id'],
      bookingDate: json['booking_date'],
      checkIn: json['check_in'],
      checkOut: json['check_out'],
      note: json['note'],
      bookingStatus: json['booking_status'],
      total: json['total'].toDouble(),
      tax: json['tax'].toDouble(),
      grandTotal: json['grandtotal'].toDouble(),
      createdAt: json['created_at'],
      updateddAt: json['updated_at'],
      hotel: Hotel.fromJson(json['hotel']),
      guest: Guest.fromJson(json['guest']),
      bookingDetail: json.containsKey('booking_detail')
          ? List<BookingDetail>.from(json['booking_detail']
              .map((booking) => BookingDetail.fromJson(booking)))
          : [],
    );
  }
}
