part of 'package:dangau_hotel/services/services.dart';

class BookingService extends ApiService {
  Future<ApiResponse<List<Booking>>> getBookings() async {
    try {
      Map<String, dynamic> response = await getData('/booking');
      List<dynamic> data = response['data'];
      return ApiResponse(
        message: response['message'],
        data: data.map((booking) => Booking.fromJson(booking)).toList(),
      );
    } catch (error) {
      throw error;
    }
  }

  Future<ApiResponse<Booking>> getBooking(int id) async {
    await Future.delayed(Duration(seconds: 1));
    try {
      Map<String, dynamic> response = await getData('/booking/$id');
      return ApiResponse(
        message: response['message'],
        data: Booking.fromJson(response['data']),
      );
    } catch (error) {
      throw error;
    }
  }

  Future<void> postBooking(OrderRequest orderRequest) async {
    Map<String, dynamic> body = orderRequest.toJson();
    print(body);
    try {
      Map<String, dynamic> response = await postData('/booking/create', body);
      print(response);
    } catch (error) {
      print(error);
    }
  }
}
