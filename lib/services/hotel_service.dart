part of 'package:dangau_hotel/services/services.dart';

class HotelService extends ApiService {
  Future<ApiResponse<HotelResponse>> getHotels() async {
    try {
      Map<String, dynamic> response = await getData('/hotel');
      return ApiResponse(
        message: response['message'],
        data: HotelResponse.fromJson(response),
      );
    } catch (error) {
      throw (error);
    }
  }

  Future<ApiResponse> getHotel(int id) async {
    try {
      Map<String, dynamic> response = await getData('/hotel/$id');
      return ApiResponse(
        message: response['message'],
        data: Hotel.fromJson(response),
      );
    } catch (error) {
      throw (error);
    }
  }
}
