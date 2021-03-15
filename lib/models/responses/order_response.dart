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
  });

  factory OrderResponse.fromMap(Map<String, dynamic> json) {
    return OrderResponse(
      id: json['id'],
      hotelId: json['hotel_id'],
      guestId: json['guest_id'],
      bookingDate: json['booking_date'],
      checkIn: json['check_in'],
      checkOut: json['check_out'],
      note: json['note'],
      bookingStatus: json['booking_status'],
      total: json['total'],
      tax: json['tax'],
      grandTotal: json['grand_total'],
      createdAt: json['created_at'],
      updateddAt: json['updated_at'],
    );
  }
}
