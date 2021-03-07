part of 'package:dangau_hotel/services/services.dart';

class HotelService extends ApiService {
  Future<ApiResponse<List<Hotel>>> getHotels() async {
    try {
      Map<String, dynamic> response = await getData('/hotel');
      List<dynamic> data = response['data'];
      return ApiResponse(
        message: response['message'],
        data: data.map((hotel) => Hotel.fromJson(hotel)).toList(),
      );
    } catch (error) {
      throw (error);
    }
  }

  Future<ApiResponse<Hotel>> getHotel(int id) async {
    try {
      Map<String, dynamic> response = await getData('/hotel/$id');
      return ApiResponse(
        message: response['message'],
        data: Hotel.fromJson(response['data']),
      );
    } catch (error) {
      throw (error);
    }
  }
}
