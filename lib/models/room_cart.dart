part of 'package:dangau_hotel/models/models.dart';

class RoomCart extends Equatable {
  final int id;
  final Room room;
  final int quantity;
  final RoomPreference roomPreference;

  const RoomCart({
    @required this.id,
    @required this.room,
    this.quantity,
    @required this.roomPreference,
  });

  RoomCart copyWith({
    int id,
    Room room,
    bool isSelected,
    int quantity,
    RoomPreference roomPreference,
  }) {
    return RoomCart(
      id: id ?? this.id,
      room: room ?? this.room,
      quantity: quantity ?? this.quantity,
      roomPreference: roomPreference ?? this.roomPreference,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'room': this.room,
        'quantity': this.quantity,
        'room_preference': this.roomPreference,
      };

  @override
  List<Object> get props => [id, room, quantity, roomPreference];

  @override
  String toString() =>
      'RoomCart { id: $id, room: ${room.name}, quantity: $quantity, preference: $roomPreference }';
}
