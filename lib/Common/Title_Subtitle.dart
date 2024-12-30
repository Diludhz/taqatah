import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget richTextSection({
  required double screenWidth,
  required double screenHeight,
  required Color fontColor,
  required Color maxFontColor,
  required String mainText,
  required String highlightedText,
  String description = "",
  double mainFontSize = 25,
  double highlightedFontSize = 28,
  double topPadding = 0,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.only(left: screenWidth * 0.06, top: topPadding),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: mainText,
                style: GoogleFonts.lato(
                  fontSize: mainFontSize,
                  fontWeight: FontWeight.normal,
                  color: fontColor,
                ),
              ),
              const TextSpan(
                text: "  ", // Space between the two words
              ),
              TextSpan(
                text: highlightedText,
                style: GoogleFonts.lato(
                  fontSize: highlightedFontSize,
                  fontWeight: FontWeight.w700,
                  color: maxFontColor,
                ),
              ),
            ],
          ),
        ),
      ),
      if (description.isNotEmpty)
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.06,
            vertical: screenHeight * 0.015,
          ),
          child: Text(
            description,
            style: GoogleFonts.lato(
              fontSize: 12,
              color: fontColor,
            ),
          ),
        ),
    ],
  );
}
