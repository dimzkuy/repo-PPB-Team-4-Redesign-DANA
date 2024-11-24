import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'custom_palette_colors.dart';

class CustomTypography {
  static TextStyle headline1 = GoogleFonts.roboto(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: CustomPaletteColors.textPrimary,
  );

  static TextStyle bodyText1 = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: CustomPaletteColors.textSecondary,
  );

  static TextStyle buttonText = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: CustomPaletteColors.background,
  );
}
