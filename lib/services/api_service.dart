part of 'package:dangau_hotel/services/services.dart';

const String BASE_URL = "http://localhost:3000";

class ApiService {
  var responseJson;

  Future<dynamic> get(String uri) async {
    try {
      final http.Response response = await http.get(BASE_URL + uri);
      responseJson = _returnResponse(response);
      // return jsonDecode(response.body);
    } catch (error) {
      print(error);
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = jsonDecode(response.body);
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
