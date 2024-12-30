import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotFound extends StatelessWidget {
  const NotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(38.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center the column
          children: [
            const SizedBox(height: 20),
            Image.asset("assets/images/img_alert.png"),
            const SizedBox(height: 14),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Search ',
                    style: GoogleFonts.lato(
                      fontSize: 25, // Font size for the 'Search' text
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Color for the 'Search' text
                    ),
                  ),
                  TextSpan(
                    text: 'not found',
                    style: GoogleFonts.raleway(
                      fontSize: 25, // Same size for consistency
                      fontWeight: FontWeight.w900, // Bold for emphasis
                      color: const Color(0xFF283E4A),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14), // Add some space between the texts
            Text(
              "Sorry, we can’t find the real estates you are looking for. Maybe, a little spelling mistake?",
              style: GoogleFonts.raleway(
                fontSize: 12, // Font size for the additional text
                color: Colors
                    .black54, // Optional: Change color for better readability
              ),
              textAlign: TextAlign.center, // Center the text
            ),
          ],
        ),
      ),
    );
  }
}
