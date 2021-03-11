part of 'package:dangau_hotel/models/models.dart';

class BookingDetail extends Equatable {
  final int id;
  final int bookingId;
  final int roomId;
  final int price;
  final int roomQty;
  final String note;
  final String createdAt;
  final String updatedAt;

  BookingDetail({
    this.id,
    this.bookingId,
    this.roomId,
    this.price,
    this.roomQty,
    this.note,
    this.createdAt,
    this.updatedAt,
  });

  factory BookingDetail.fromJson(Map<String, dynamic> json) {
    return BookingDetail(
      id: json['id'],
      bookingId: json['booking_id'],
      roomId: json['room_id'],
      price: json['price'],
      roomQty: json['room_qty'],
      note: json['note'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'BookingDetail(id: $id, bookingId: $bookingId, roomId: $roomId, price: $price, roomQty: $roomQty, note: $note, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
