import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

  static Container customSocialButton({
    required String label,
    required String platform,
    required VoidCallback onPressed,
  }) {
    IconData icon;
    switch (platform.toLowerCase()) {
      case 'facebook':
        icon = FontAwesomeIcons.facebookF;
        break;
      case 'google':
        icon = FontAwesomeIcons.google;
        break;
      default:
        icon = FontAwesomeIcons.question;
    }

    return Container(
      width: 160,
      height: 48,
      decoration: BoxDecoration(
        color: CustomPaletteColors.inputFieldColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(icon, color: Colors.black),
            SizedBox(width: 10),
            Text(
              label,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
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
