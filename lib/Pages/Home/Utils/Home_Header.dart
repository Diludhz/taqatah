import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget headerText({
  required String text1,
  required String text2,
  required Color text1Color,
  required Color text2Color,
  double text1FontSize = 25,
  double text2FontSize = 28,
  FontWeight text1FontWeight = FontWeight.normal,
  FontWeight text2FontWeight = FontWeight.w700,
  EdgeInsets padding = const EdgeInsets.only(left: 24.0),
}) {
  return Padding(
    padding: padding,
    child: RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: text1,
            style: GoogleFonts.lato(
              fontSize: text1FontSize,
              fontWeight: text1FontWeight,
              color: text1Color,
            ),
          ),
          if (text2.isNotEmpty)
            TextSpan(
              text: " $text2",
              style: GoogleFonts.lato(
                fontSize: text2FontSize,
                fontWeight: text2FontWeight,
                color: text2Color,
              ),
            ),
        ],
      ),
    ),
  );
}
