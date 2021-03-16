part of 'package:dangau_hotel/models/models.dart';

class BookingDetail extends Equatable {
  final int id;
  final int bookingId;
  final int roomId;
  final double price;
  final int roomQty;
  final double subTotal;
  final String note;
  final String createdAt;
  final String updatedAt;
  final Room room;

  BookingDetail({
    this.id,
    this.bookingId,
    this.roomId,
    this.price,
    this.roomQty,
    this.subTotal,
    this.note,
    this.createdAt,
    this.updatedAt,
    this.room,
  });

  factory BookingDetail.fromJson(Map<String, dynamic> json) {
    return BookingDetail(
      id: json['id'],
      bookingId: json['booking_id'],
      roomId: json['room_id'],
      price: json['price'].toDouble(),
      roomQty: json['room_qty'],
      subTotal: json['subtotal'].toDouble(),
      note: json['note'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      room: Room.fromJson(json['room']),
    );
  }

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'BookingDetail (id: $id, bookingId: $bookingId, roomId: $roomId, price: $price, roomQty: $roomQty, note: $note, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
