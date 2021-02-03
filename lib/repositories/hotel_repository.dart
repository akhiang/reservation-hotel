part of 'package:dangau_hotel/repositories/repositories.dart';

const String apiUrl = 'https://in-store-add.herokuapp.com/api/v1';

abstract class HotelRepository {
  Future<List<Hotel>> getHotels();
}

class HotelRepositoryImplement implements HotelRepository {
  @override
  Future<List<Hotel>> getHotels() async {
    try {
      http.Response response = await http.get('$apiUrl/categories');
      print(response);
      if (response.statusCode == 200) {
        List<dynamic> responseJson = jsonDecode(response.body)['data'];
        List<Hotel> products =
            responseJson.map((product) => Hotel.fromJson(product)).toList();
        return products;
      }
    } catch (e) {
      print(e);
    }
  }
}
