import 'dart:convert';

class Order {
  final int id;
  final String number;

  Order({this.id, this.number});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'number': number,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'],
      number: map['number'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));
}
