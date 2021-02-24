part of 'package:dangau_hotel/services/services.dart';

class HotelService {
  ApiService apiService = ApiService();

  Future<List<Hotel>> getHotels() async {
    await Future.delayed(Duration(seconds: 1));
    List<Hotel> hotels;
    try {
      List<dynamic> response = await apiService.getData('/hotels');
      hotels = response.map((hotel) => Hotel.fromJson(hotel)).toList();
    } catch (error) {
      throw (error);
    }
    return hotels;
  }

  Future<Hotel> getHotel(int id) async {
    await Future.delayed(Duration(seconds: 1));
    Hotel hotel;
    try {
      var response = await apiService.getData('/hotels/$id');
      hotel = Hotel.fromJson(response);
    } catch (error) {
      throw (error);
    }
    return hotel;
  }
}
