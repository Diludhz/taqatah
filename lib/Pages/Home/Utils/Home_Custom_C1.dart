import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqatah/Data/Images_Data.dart';

class CustomContainer extends StatelessWidget {
  final String imageUrl;
  final String text1;
  final String text2;
  final String subtitle;

  const CustomContainer({
    super.key,
    required this.imageUrl,
    required this.text1,
    required this.text2,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 10),
      child: Container(
        height: 180,
        width: screenWidth * 0.7, // Responsive width
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
              bottomRight: Radius.circular(25)),
          border: Border.all(color: Colors.grey),
        ),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            // Background image
            Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            // Top left text
            Positioned(
              top: 20,
              left: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customText(text1, 18, FontWeight.bold),
                  customText(text2, 18, FontWeight.bold),
                  customText(subtitle, 10, FontWeight.normal),
                ],
              ),
            ),
            // Bottom left circular container with icon
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                height: 56,
                width: screenWidth * 0.25, // Adjusted for responsiveness
                decoration: const BoxDecoration(
                  color: Color(0xFF283E4A),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    arrow_icon,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to reduce repetitive text widget creation
  Widget customText(String text, double fontSize, FontWeight fontWeight) {
    return Text(
      text,
      style: GoogleFonts.raleway(
        color: Colors.white,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
