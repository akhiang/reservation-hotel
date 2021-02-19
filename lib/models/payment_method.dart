part of 'package:dangau_hotel/models/models.dart';

class PaymentMethod extends Equatable {
  final int id;
  final int paymentType;
  final String name;

  PaymentMethod({
    this.id,
    this.paymentType,
    this.name,
  });

  factory PaymentMethod.fromJson(Map<String, dynamic> json) {
    return PaymentMethod(
      id: json['id'],
      name: json['name'],
      paymentType: json['payment_type'],
    );
  }

  @override
  List<Object> get props => [id, name, paymentType];

  @override
  String toString() => 'PaymentMethod { id: $id, name: $name }';
}

List<PaymentMethod> methods = [
  PaymentMethod(
    id: 1,
    paymentType: 1,
    name: "BCA Virtual Account",
  ),
  PaymentMethod(
    id: 2,
    paymentType: 1,
    name: "Mandiri Virtual Account",
  ),
  PaymentMethod(
    id: 3,
    paymentType: 1,
    name: "BNI Virtual Account",
  ),
  PaymentMethod(
    id: 4,
    paymentType: 2,
    name: "Master Card",
  ),
  PaymentMethod(
    id: 5,
    paymentType: 2,
    name: "Visa Credit",
  ),
];
