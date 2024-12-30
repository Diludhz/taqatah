import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget DividerLines(BuildContext context) {
  final screenHeight = MediaQuery.of(context).size.height;
  final screenWidth = MediaQuery.of(context).size.width;

  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: screenHeight * 0.03, // Vertical padding based on screen height
      horizontal:
          screenWidth * 0.06, // Horizontal padding based on screen width
    ),
    child: Row(
      children: [
        Expanded(
          child: Divider(
            color: const Color(0xFFECEDF3),
            thickness: screenHeight * 0.001, // Dynamic divider thickness
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
          child: Text(
            'OR',
            style: GoogleFonts.lato(
              fontSize: screenHeight * 0.02, // Dynamic text size
              fontWeight: FontWeight.bold,
              color: const Color(0xFF252B5C),
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: const Color(0xFFECEDF3),
            thickness: screenHeight * 0.001, // Dynamic divider thickness
          ),
        ),
      ],
    ),
  );
}
