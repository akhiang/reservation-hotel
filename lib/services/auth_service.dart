part of 'package:dangau_hotel/services/services.dart';

class AuthService extends ApiService {
  Future<LoginResponse> login() async {
    try {
      Map<String, dynamic> response = await postData('/auth/login');
    } catch (error) {
      throw (error);
    }
  }
}
