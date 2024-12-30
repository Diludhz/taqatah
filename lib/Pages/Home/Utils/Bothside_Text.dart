import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget headerRow({
  required double screenWidth,
  required double screenHeight,
  required String locationIconPath,
  required String dropDownIconPath,
  required String notificationIconPath,
  required String userProfilePath,
  required Color appPrimaryColor,
  required Color appSecondaryColor,
  required Color containerInnerColor,
  required String locationText,
  VoidCallback? onNotificationTap,
  VoidCallback? onProfileTap,
}) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Row(
      children: [
        // Left-aligned location container
        Container(
          height: screenHeight * 0.05,
          width: screenWidth * 0.4,
          decoration: BoxDecoration(
            color: appPrimaryColor,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                blurRadius: 1,
                spreadRadius: 0.5,
                color: containerInnerColor,
                offset: const Offset(1, 1),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset(locationIconPath),
                const SizedBox(width: 8), // Space between icon and text
                Text(
                  locationText,
                  style: GoogleFonts.raleway(
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(
                    width: 10), // Space between text and dropdown icon
                Image.asset(dropDownIconPath),
              ],
            ),
          ),
        ),
        const Spacer(), // Pushes the following widgets to the right
        // Right-aligned alarm badge container
        GestureDetector(
          onTap: onNotificationTap,
          child: Container(
            height: screenHeight * 0.05,
            width: screenWidth * 0.1,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: appPrimaryColor,
              boxShadow: [
                BoxShadow(
                  blurRadius: 1,
                  spreadRadius: 2,
                  color: containerInnerColor,
                  offset: const Offset(1, 1),
                ),
              ],
            ),
            child: Center(
              child: Badge(
                backgroundColor: Colors.red,
                child: Image.asset(
                  notificationIconPath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10), // Space between badge and avatar
        // Right-aligned profile image container
        GestureDetector(
          onTap: onProfileTap,
          child: Container(
            height: screenHeight * 0.05,
            width: screenWidth * 0.1,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: appPrimaryColor,
              border: Border.all(
                color: appSecondaryColor,
              ),
            ),
            child: Center(
              child: Image.asset(
                userProfilePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
