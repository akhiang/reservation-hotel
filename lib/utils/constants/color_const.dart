// part of 'package:dangau_hotel/utils/utils.dart';

import 'package:flutter/material.dart';

class ColorConst {
  static const kPrimaryColor = Color(0xFFF4C755);
  static const kSecondaryColor = Color(0xFF24253D);
  static const kThirdColor = Color(0xFFF5F9FF);
  static const kSuccessColor = Color(0xFF49C584);
  static const kErrorColor = Color(0xFFEE6172);
  static final kPrimarySwatchColor = generateMaterialColor(Color(0xFFF4C755));
}

MaterialColor generateMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}
