part of 'package:dangau_hotel/services/services.dart';

class PaymentMethodService {
  ApiService apiService = ApiService();

  Future<List<PaymentMethod>> getPaymentMethods() async {
    await Future.delayed(Duration(seconds: 1));
    List<PaymentMethod> paymentMethod;
    try {
      List<dynamic> response = await apiService.getData('/payment_method');
      paymentMethod =
          response.map((method) => PaymentMethod.fromJson(method)).toList();
    } catch (e) {
      print('e asd ' + e.toString());
    }
    return paymentMethod;
  }
}
