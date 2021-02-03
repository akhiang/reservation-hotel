part of 'package:dangau_hotel/services/services.dart';

class HotelService {
  ApiService apiService = ApiService();

  Future<List<Hotel>> getHotels() async {
    try {
      http.Response response = await apiService.get('/hotels');
      // return
    } catch (e) {
      print(e);
    }
  }
}
