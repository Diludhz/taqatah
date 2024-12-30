import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqatah/Common/Divider_Function.dart';
import 'package:taqatah/Data/Images_Data.dart';

import '../../Common/Not_Account.dart';
import '../../Common/Social_Containers.dart';
import '../Login/Sigin_Screen.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            explore_image1,
            width: double.infinity,
            height: screenHeight * 0.3, // Adjust height dynamically
            fit: BoxFit.cover,
          ),
          SizedBox(height: screenHeight * 0.04), // Dynamic spacing
          Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.06), // Adjust padding dynamically
            child: RichText(
              text: TextSpan(
                style: GoogleFonts.lato(
                  fontSize: screenHeight * 0.03, // Dynamic font size
                  color: const Color(0xFF252B5C),
                ),
                children: [
                  const TextSpan(text: "Ready to "),
                  TextSpan(
                    text: "explore?",
                    style: GoogleFonts.lato(
                      fontSize: screenHeight * 0.035, // Dynamic font size
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF283E4A),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.06), // Dynamic spacing
          Center(
            child: GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SignPage()),
              ),
              child: _buildButton(
                "assets/icons/ic_explore_email.png",
                "Continue with E-mail",
                screenHeight,
                screenWidth,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.04), // Dynamic spacing
          DividerLines(context),
          SizedBox(height: screenHeight * 0.04), // Dynamic spacing
          SocialButtons(context),
          const Spacer(),
          BottomRegisterText(context)
        ],
      ),
    );
  }

  Widget _buildButton(
      String iconPath, String text, double screenHeight, double screenWidth) {
    return Container(
      height: screenHeight * 0.08, // Button height based on screen height
      width: screenWidth * 0.7, // Button width based on screen width
      decoration: BoxDecoration(
        color: const Color(0xFF612C8C),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconPath,
              height: screenHeight * 0.025, width: screenWidth * 0.05),
          SizedBox(width: screenWidth * 0.03), // Dynamic spacing
          Text(
            text,
            style: GoogleFonts.lato(
              fontSize: screenHeight * 0.02, // Dynamic font size
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
