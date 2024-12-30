import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqatah/Data/Images_Data.dart';
import 'package:taqatah/Pages/Splash/Explore_Screen.dart';
import '../../Data/Colors_Data.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: appPrimaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.075),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  splash_logo,
                  height: screenHeight * 0.4,
                  width: screenWidth * 0.7,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ExplorePage()),
              ),
              child: Container(
                height: screenHeight * 0.07,
                width: screenWidth * 0.5,
                decoration: BoxDecoration(
                  color: appSecondaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Let’s Start',
                    style: GoogleFonts.lato(
                      fontSize: screenHeight * 0.02,
                      fontWeight: FontWeight.bold,
                      color: appPrimaryColor,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Text(
              'v.1.0',
              style: GoogleFonts.montserrat(
                fontSize: screenHeight * 0.013,
                fontWeight: FontWeight.bold,
                color: textcolor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
