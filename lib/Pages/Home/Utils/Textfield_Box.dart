import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildSearchBox({
  required double screenHeight,
  required String searchIconPath,
  required String hintText,
  required Color boxColor,
  required Color borderColor,
  required Color hintTextColor,
  double borderRadius = 10.0,
  double fontSize = 16.0,
  EdgeInsets padding = const EdgeInsets.all(24.0),
  required VoidCallback onTap,
}) {
  return Padding(
    padding: padding,
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        height: screenHeight * 0.09,
        width: double.infinity,
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: borderColor),
        ),
        child: TextField(
          enabled: false, // Disabled to make it a tap-only field
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(searchIconPath), // Prefix icon
            ),
            hintText: hintText,
            hintStyle: GoogleFonts.raleway(
              fontSize: fontSize,
              color: hintTextColor,
            ),
            border: InputBorder.none, // No border
            contentPadding: const EdgeInsets.symmetric(
              vertical: 20.0, // Center vertically
            ),
          ),
        ),
      ),
    ),
  );
}
