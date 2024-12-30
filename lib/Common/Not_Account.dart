import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Pages/Login/Register_Screen.dart';

Widget BottomRegisterText(BuildContext context) {
  final screenHeight = MediaQuery.of(context).size.height;
  //final screenWidth = MediaQuery.of(context).size.width;

  return Center(
    child: Padding(
      padding: EdgeInsets.only(
          bottom: screenHeight * 0.03), // Dynamic bottom padding
      child: RichText(
        text: TextSpan(
          style: GoogleFonts.lato(
            fontSize: screenHeight * 0.02, // Dynamic font size
            color: const Color(0xFF252B5C),
          ),
          children: [
            const TextSpan(text: "Don't have an account? "),
            TextSpan(
              text: "Register",
              style: GoogleFonts.lato(
                fontWeight: FontWeight.w700,
                color: const Color(0xFF283E4A),
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const RegistrationPage()),
                    ),
            ),
          ],
        ),
      ),
    ),
  );
}
