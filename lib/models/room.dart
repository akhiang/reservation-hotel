part of 'package:dangau_hotel/models/models.dart';

class Room extends Equatable {
  final int id;
  final int hotelId;
  final int roomTypeId;
  final int roomQuote;
  final int isSmoking;
  final String bedType;
  final String createdAt;
  final String updatedAt;
  final RoomType roomType;

  Room({
    this.id,
    this.hotelId,
    this.roomTypeId,
    this.roomQuote,
    this.isSmoking,
    this.bedType,
    this.createdAt,
    this.updatedAt,
    this.roomType,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'],
      hotelId: json['hotel_id'],
      roomTypeId: json['room_type_id'],
      roomQuote: json['room_quote'],
      isSmoking: json['is_smoking'],
      bedType: json['bed_type'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      roomType: RoomType.fromJson(json['room_type']),
    );
  }

  @override
  List<Object> get props => [];

  @override
  String toString() => 'Room { id: $id, hotel: $hotelId }';
}
