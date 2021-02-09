part of 'package:dangau_hotel/models/models.dart';

class RoomCart extends Equatable {
  final int roomId;
  final bool isSmoke;
  final bool isSingleBed;
  final int quantity;
  final String note;

  RoomCart({
    this.roomId,
    this.isSmoke,
    this.isSingleBed,
    this.quantity,
    this.note,
  });

  Map<String, dynamic> toJson() => {
        'room_id': this.roomId,
        'is_smoke': this.isSmoke,
        'is_single_bed': this.isSingleBed,
        'quantity': this.quantity,
        'note': this.note,
      };

  @override
  List<Object> get props => [roomId, isSmoke, isSingleBed, quantity];

  @override
  String toString() =>
      'RoomCart { roomId: $roomId, smoke: $isSmoke, singleBed: $isSingleBed }';
}
