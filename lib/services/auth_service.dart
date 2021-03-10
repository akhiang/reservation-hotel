part of 'package:dangau_hotel/services/services.dart';

class AuthService extends ApiService {
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    try {
      Map<String, dynamic> response =
          await postData('/auth/login', loginRequest.toJson());
      // print(response);
      return LoginResponse.fromJson(response);
    } catch (error) {
      throw (error);
    }
  }
}
