part of 'package:dangau_hotel/services/services.dart';

class RoomService {
  ApiService apiService = ApiService();

  Future<List<Room>> getRooms(int hotelId) async {
    await Future.delayed(Duration(seconds: 1));
    List<Room> rooms;
    try {
      List<dynamic> response =
          await apiService.getData('/hotels/$hotelId/rooms');
      rooms = response.map((room) => Room.fromJson(room)).toList();
    } catch (e) {
      print('e asd ' + e.toString());
    }
    return rooms;
  }

  Future<Room> getRoom(int id) async {
    await Future.delayed(Duration(seconds: 1));
    Room room;
    try {
      var response = await apiService.getData('/rooms/$id');
      room = Room.fromJson(response);
      print(room);
    } catch (e) {
      print('e service ' + e.toString());
    }
    return room;
  }
}
