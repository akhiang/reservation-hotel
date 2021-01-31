part of 'package:dangau_hotel/models/models.dart';

class PaymentMethod {
  int id;
  String name;
  // String bankName;

  PaymentMethod({
    this.id,
    this.name,
    // this.bankName,
  });
}

List<PaymentMethod> methods = [
  PaymentMethod(
    id: 1,
    name: "BCA Virtual Account",
  ),
  PaymentMethod(
    id: 2,
    name: "Visa",
  ),
  PaymentMethod(
    id: 3,
    name: "Master Card",
  ),
];
