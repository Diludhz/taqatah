import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqatah/Pages/Home/Home_Screen.dart';
import 'package:taqatah/common/back_button.dart';

import '../../../Data/Colors_Data.dart';

Widget SkipButton(BuildContext context) {
  final size = MediaQuery.of(context).size;
  // final height = size.height;
  final width = size.width;

  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal:
          width * 0.06, // Responsive horizontal padding (6% of screen width)
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        backButton(width: width, onTap: () {}),
        _buildSkipButton(context),
      ],
    ),
  );
}

Widget _buildSkipButton(BuildContext context) {
  // Adjust skip button size using MediaQuery
  final screenWidth = MediaQuery.of(context).size.width;
  final buttonHeight = screenWidth * 0.1; // 10% of screen width
  final buttonWidth = screenWidth * 0.22; // 22% of screen width

  return GestureDetector(
    onTap: () => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MainContentScreen()),
    ),
    child: Container(
      height: buttonHeight,
      width: buttonWidth,
      decoration: BoxDecoration(
        color: containerinnercolor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          "Skip",
          style: GoogleFonts.montserrat(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: textcolor,
          ),
        ),
      ),
    ),
  );
}
