import 'package:flutter/material.dart';
import 'custom_palette_colors.dart';
import 'custom_typography.dart';

class ButtonSystems {
  static ElevatedButton customElevatedButton({
    required String label,
    required VoidCallback onPressed,
    Color? backgroundColor,
    Color? foregroundColor,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? CustomPaletteColors.accent,
        foregroundColor: foregroundColor ?? CustomPaletteColors.background,
        textStyle: CustomTypography.buttonText,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }

  static TextButton customTextButton({
    required String label,
    required VoidCallback onPressed,
  }) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          color: CustomPaletteColors.secondary,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
