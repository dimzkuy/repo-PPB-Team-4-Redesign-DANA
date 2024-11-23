import 'package:flutter/material.dart';
import 'custom_palette_colors.dart';
import 'custom_typography.dart';

class ButtonSystems {
  static ElevatedButton customElevatedButton({
    required String label,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: CustomPaletteColors.accent, // Ganti primary dengan backgroundColor
        foregroundColor: CustomPaletteColors.background, // Ganti onPrimary dengan foregroundColor
        textStyle: CustomTypography.buttonText,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}