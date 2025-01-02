import 'package:flutter/material.dart';

class ColorThemes {
  // Definisikan warna
  static const Color textColor = Color(0xFF081B39);
  static const Color backgroundColor = Color(0xFFf8F8F7);
  static const Color primaryColor = Color(0xFF118EEA);
  static const Color primaryFgColor = Color(0xFF081B39);
  static const Color secondaryColor = Color(0xFF83C3F3);
  static const Color secondaryFgColor = Color(0xFF081B39);
  static const Color accentColor = Color(0xFF6ec472);
  static const Color accentFgColor = Color(0xFF081B39);

  // Definisikan skema warna
  static const ColorScheme colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: primaryColor,
    onPrimary: primaryFgColor,
    secondary: secondaryColor,
    onSecondary: secondaryFgColor,
    surface:
        backgroundColor, // Menggunakan surface sebagai pengganti background
    onSurface: textColor,
    error: Color(0xffB3261E),
    onError: Color(0xffFFFFFF),
  );
}
