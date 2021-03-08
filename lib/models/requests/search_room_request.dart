part of 'package:dangau_hotel/models/models.dart';

class SearchRoomRequest {
  final int hotelId;
  final DateTime startDate;
  final DateTime endDate;

  SearchRoomRequest({
    this.hotelId,
    this.startDate,
    this.endDate,
  });
}
