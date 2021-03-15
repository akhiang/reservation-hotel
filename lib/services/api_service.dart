part of 'package:dangau_hotel/services/services.dart';

class ApiService {
  static const String BASE_URL = Environment.apiUrl;
  static const HEADERS = {"Accept": "application/json"};
  var responseJson;

  Future<dynamic> getData(String uri) async {
    try {
      final http.Response response = await http.get(
        BASE_URL + uri,
        headers: HEADERS,
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('Error occured');
    }
    return responseJson;
  }

  Future<dynamic> postData(String uri, body) async {
    String token = await AuthPreferences.getToken();
    try {
      final http.Response response = await http.post(
        BASE_URL + uri,
        headers: _getAuthorizationHeader(token),
        body: jsonEncode(body),
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('Error occured');
    }
    return responseJson;
  }

  Map<String, String> _getAuthorizationHeader(String token) {
    return {
      "Accept": "application/json",
      "Authorization": "Bearer $token",
    };
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = jsonDecode(response.body);
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
