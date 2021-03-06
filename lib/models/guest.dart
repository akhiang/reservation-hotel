import 'dart:convert';

class Guest {
  final String name;

  Guest({
    this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  factory Guest.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Guest(
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Guest.fromJson(String source) => Guest.fromMap(
        json.decode(source),
      );
}
