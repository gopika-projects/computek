import 'dart:math';

import 'package:flutter/material.dart';

abstract class Palette {
  //static const Color primary = Color(0xFFFCE900);
  static const Color primary = Color(0xFFF15B2A);
  static Color toast = primary.withOpacity(0.9);
  static const Color accent = Color(0xFF263238);
  static const Color background = Color(0xFFF7F8FC);
  static const Color border = Color(0xFFF5F4F9);
  static const Color orange = Color(0xffF28939);
  static Color white = Colors.white; //Colors.grey[50]!;
  static Color shadowF = Color(0xFF000000).withAlpha(15);
  static Color shadowD = Color(0xFF000000).withAlpha(13);
  static Color hint = Color(0xff000000).withAlpha(77);
  static const Color text1 = Color(0xff272833);
  static Color textGrey = Color(0xff000000).withAlpha(176);
}

MaterialColor generateMaterialColor(Color color) {
  return MaterialColor(color.value, {
    50: tintColor(color, 0.9),
    100: tintColor(color, 0.8),
    200: tintColor(color, 0.6),
    300: tintColor(color, 0.4),
    400: tintColor(color, 0.2),
    500: color,
    600: shadeColor(color, 0.1),
    700: shadeColor(color, 0.2),
    800: shadeColor(color, 0.3),
    900: shadeColor(color, 0.4),
  });
}

int tintValue(int value, double factor) {
  return max(0, min((value + ((255 - value) * factor)).round(), 255));
}

Color tintColor(Color color, double factor) {
  return Color.fromRGBO(
    tintValue(color.red, factor),
    tintValue(color.green, factor),
    tintValue(color.blue, factor),
    1,
  );
}

int shadeValue(int value, double factor) {
  return max(0, min(value - (value * factor).round(), 255));
}

Color shadeColor(Color color, double factor) {
  return Color.fromRGBO(
    shadeValue(color.red, factor),
    shadeValue(color.green, factor),
    shadeValue(color.blue, factor),
    1,
  );
}
