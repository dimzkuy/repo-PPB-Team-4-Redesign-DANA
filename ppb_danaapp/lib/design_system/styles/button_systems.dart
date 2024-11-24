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

  // Variabel tombol untuk digunakan di home_screen
  static ElevatedButton payNowButton(VoidCallback onPressed) {
    return customElevatedButton(
      label: 'Pay Now!',
      onPressed: onPressed,
      backgroundColor: CustomPaletteColors.primary,
      foregroundColor: Colors.white,
    );
  }

  static TextButton topUpButton(VoidCallback onPressed) {
    return customTextButton(
      label: '+ Top Up',
      onPressed: onPressed,
    );
  }

  static ElevatedButton showButton(VoidCallback onPressed) {
    return customElevatedButton(
      label: 'Show',
      onPressed: onPressed,
      backgroundColor: CustomPaletteColors.secondary,
      foregroundColor: Colors.white,
    );
  }
}
