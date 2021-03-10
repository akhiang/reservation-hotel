part of 'package:dangau_hotel/services/services.dart';

class RoomService extends ApiService {
  Future<ApiResponse<List<Room>>> getRooms(
      SearchRoomRequest searchRoomRequest) async {
    String startDate =
        DateFormat('yyyy-MM-dd').format(searchRoomRequest.startDate);
    String endDate = DateFormat('yyyy-MM-dd').format(searchRoomRequest.endDate);
    await Future.delayed(Duration(seconds: 1));
    try {
      Map<String, dynamic> response = await getData(
          '/search?hotel_id=${searchRoomRequest.hotelId}&check_in=$startDate&check_out=$endDate');
      List<dynamic> data = response['data'];
      return ApiResponse(
        message: response['message'],
        data: data.map((room) => Room.fromJson(room)).toList(),
      );
    } catch (error) {
      throw (error);
    }
  }

  Future<ApiResponse<Room>> getRoom(int id) async {
    await Future.delayed(Duration(seconds: 1));
    try {
      Map<String, dynamic> response = await getData('/room-type/$id');
      return ApiResponse(
        message: response['message'],
        data: Room.fromJson(response['data']),
      );
    } catch (error) {
      throw (error);
    }
  }
}
