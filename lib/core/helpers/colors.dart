import 'package:flutter/material.dart';

extension ColorExtension on Color {
  Color darken([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }

  Color lighten([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
    return hslLight.toColor();
  }
}

sealed class AppColors {
  static Color get rattingBad => const Color.fromARGB(255, 225, 42, 28);
  static Color get rattingOk => const Color.fromARGB(255, 178, 108, 4);
  static Color get rattingGood => const Color.fromARGB(255, 21, 82, 237);
  static Color get rattingGreat => const Color.fromARGB(255, 22, 125, 25);
  static Color get status => const Color.fromARGB(255, 225, 99, 247);
  static Color get imagePlaceholder => Colors.black;
  static Color get imageFilter => const Color.fromARGB(255, 11, 0, 0);
  static Color get line => Colors.white.withOpacity(0.1);
  static Color get link => const Color.fromARGB(255, 255, 167, 154);
  static Color get buttonColor => const Color.fromARGB(255, 57, 48, 45);
  static Color get title => Colors.white;
  static Color floatPageColor(BuildContext context) => Theme.of(context).colorScheme.tertiary;
  static Color get label => Colors.white.withOpacity(0.5);
  static Color get text => Colors.white;
}
