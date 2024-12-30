import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget forgotPasswordButton(Function() onForgotPassword) {
  return Padding(
    padding: const EdgeInsets.only(left: 17),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: onForgotPassword,
          child: Text(
            "Forgot Password?",
            style: GoogleFonts.lato(
              fontSize: 12,
              color: const Color(0xFF283E4A),
            ),
          ),
        ),
      ],
    ),
  );
}
