import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart'; // For input formatters

class MinMaxInputRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Calculate the dynamic width using MediaQuery
    double containerWidth = MediaQuery.of(context).size.width * 0.42; // Each container takes 40% of screen width
    return Padding(
      padding: const EdgeInsets.all(12.0), // Optional padding for spacing
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // First Container with Min TextField
          Container(
            height: 38,
            width: containerWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey), // Border style
            ),
            child: TextField(
              keyboardType: TextInputType.number, // Numeric keyboard
              inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Allow numbers only
              decoration:  InputDecoration(
                hintText: 'Min', // Hint text
                  hintStyle: GoogleFonts.raleway(),
                border: InputBorder.none, // Remove default border
                contentPadding:EdgeInsets.all(8) // Padding inside the TextField
              ),
            ),
          ),
          // Second Container with Max TextField
          Container(
            height: 38,
            width: containerWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey), // Border style
            ),
            child: TextField(
              keyboardType: TextInputType.number, // Numeric keyboard
              inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Allow numbers only
              decoration: InputDecoration(
                hintText: 'Max', // Hint text
                  hintStyle: GoogleFonts.raleway(),
                border: InputBorder.none, // Remove default border
                  contentPadding:EdgeInsets.all(8) // Padding inside the TextField
              ),
            ),
          ),
        ],
      ),
    );
  }
}


