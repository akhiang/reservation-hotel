part of 'package:dangau_hotel/models/models.dart';

class OrderRequest extends Equatable {
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

  OrderRequest copyWith({
    int hotelId,
    int guestId,
    String checkIn,
    String checkOut,
    List<OrderRoomRequest> selectedRoom,
  }) {
    return OrderRequest(
      hotelId: hotelId ?? this.hotelId,
      guestId: guestId ?? this.guestId,
      checkIn: checkIn ?? this.checkIn,
      checkOut: checkOut ?? this.checkOut,
      selectedRoom: selectedRoom ?? this.selectedRoom,
    );
  }

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
  List<Object> get props => [];

  @override
  String toString() =>
      'OrderReq { hotelId: $hotelId, guestId: $guestId, checkIn: $checkIn, room: $selectedRoom }';
}
