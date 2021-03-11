part of 'package:dangau_hotel/services/services.dart';

class BookedService extends ApiService {
  Future<void> getBookedList() async {
    try {
      Map<String, dynamic> response = await getData('/booking');
    } catch (error) {}
  }
}
