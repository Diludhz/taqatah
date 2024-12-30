import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RowWithTextButton extends StatelessWidget {
  final String? leftText;
  final String? rightButtonText;
  final VoidCallback? onRightButtonPressed;

  const RowWithTextButton({
    super.key,
    this.leftText,
    this.rightButtonText,
    this.onRightButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left-side text
          Text(
            leftText ?? '',
            style: GoogleFonts.raleway(
              fontSize: 15,
              color: const Color(0xFF252B5C),
              fontWeight: FontWeight.bold,
            ),
          ),
          // Right-side text button
          TextButton(
            onPressed: onRightButtonPressed,
            child: Text(
              rightButtonText ?? '',
              style: GoogleFonts.raleway(
                fontSize: 13,
                color: const Color(0xFF252B5C),
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
