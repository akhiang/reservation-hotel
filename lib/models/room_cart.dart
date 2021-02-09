part of 'package:dangau_hotel/models/models.dart';

class RoomCart {
  final Room room;
  bool isSelected;
  int quantity;
  RoomPreference roomPreference;

  RoomCart({
    this.room,
    this.isSelected = false,
    this.quantity = 0,
    this.roomPreference,
  });

  Map<String, dynamic> toJson() => {
        'room': this.room,
        'is_selected': this.isSelected,
        'quantity': this.quantity,
        'room_preference': this.roomPreference,
      };

  // @override
  // List<Object> get props => [room, isSelected, quantity, roomPreference];

  @override
  String toString() =>
      'RoomCart { room: $room, isSelected: $isSelected, quantity: $quantity, preference: $roomPreference }';
}
