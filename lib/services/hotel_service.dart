part of 'package:dangau_hotel/services/services.dart';

class HotelService {
  ApiService apiService = ApiService();

  Future<List<Hotel>> getHotels() async {
    await Future.delayed(Duration(seconds: 1));
    List<Hotel> hotels;
    try {
      List<dynamic> response = await apiService.getData('/hotels');
      hotels = response.map((hotel) => Hotel.fromJson(hotel)).toList();
      print(hotels);
    } catch (e) {
      print('e asd ' + e.toString());
    }
    return hotels;
  }

  Future<Hotel> getHotel(int id) async {
    await Future.delayed(Duration(seconds: 1));
    Hotel hotel;
    try {
      var response = await apiService.getData('/hotels/$id');
      hotel = Hotel.fromJson(response);
      print(hotel);
    } catch (e) {
      print('e service ' + e.toString());
    }
    return hotel;
  }
}
