import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Customizable Text Field Widget
Widget favoriteCustomTextField({
  required String hintText, // Hint text for the TextField
  required String iconPath, // Path for the asset icon
  required TextEditingController controller, // Controller for the TextField
  String? prefixIconPath, // Optional prefix icon path
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 75,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          if (prefixIconPath != null)
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Image.asset(prefixIconPath), // Optional prefix icon
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText, // Customizable hint text
                  hintStyle: GoogleFonts.raleway(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: const Color(0xFFA1A5C1),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Image.asset(iconPath), // Customizable icon
          ),
        ],
      ),
    ),
  );
}
