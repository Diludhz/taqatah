import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget editResetTextContainer({
  required String titleText, // Title text
  required String buttonText, // Button label text
  required VoidCallback onButtonPressed, // Button action callback
  required double screenWidth, // Screen width for responsiveness
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center, // Align vertically at the center
    children: [
      Text(
        titleText,
        style: GoogleFonts.lato(
          fontSize: screenWidth * 0.045, // Responsive text size
          fontWeight: FontWeight.bold,
          color: const Color(0xFF252B5C),
        ),
      ),
      ElevatedButton(
        onPressed: onButtonPressed, // Handle button press
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: const Color(0xFF283E4A),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: GoogleFonts.raleway(
              fontSize: screenWidth * 0.025, // Responsive text size
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ],
  );
}
