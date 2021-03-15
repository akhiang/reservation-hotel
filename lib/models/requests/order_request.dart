part of 'package:dangau_hotel/models/models.dart';

class OrderRequest {
  final int hotelId;
  final int guestId;
  final String checkIn;
  final String checkOut;
  final List<OrderRoomRequest> selectedRoom;

  OrderRequest({
    this.hotelId,
    this.guestId,
    this.checkIn,
    this.checkOut,
    this.selectedRoom,
  });

  Map<String, dynamic> toJson() {
    return {
      'hotel_id': this.hotelId,
      'guest_id': this.guestId,
      'check_in': this.checkIn,
      'check_out': this.checkOut,
      'detail_booking': this.selectedRoom,
    };
  }

  @override
  String toString() =>
      'OrderReq { hotelId: $hotelId, guestId: $guestId, checkIn: $checkIn }';
}
