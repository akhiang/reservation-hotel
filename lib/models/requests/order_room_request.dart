part of 'package:dangau_hotel/models/models.dart';

class OrderRoomRequest {
  final int roomId;
  final double price;
  final int roomQty;
  final String note;

  OrderRoomRequest({
    this.roomId,
    this.price,
    this.roomQty,
    this.note,
  });

  Map<String, dynamic> toJson() {
    return {
      'room_id': this.roomId,
      'price': this.price,
      'room_qty': this.roomQty,
      'note': this.note,
    };
  }

  factory OrderRoomRequest.fromJson(Map<String, dynamic> json) {
    return OrderRoomRequest(
      roomId: json['room_id'],
      price: json['price'],
      roomQty: json['room_qty'],
      note: json['note'],
    );
  }

  @override
  String toString() =>
      'Room Req { roomId: $roomId, price: $price, roomQty: $roomQty }';
}
