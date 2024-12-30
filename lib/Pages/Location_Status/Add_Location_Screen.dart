import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqatah/Common/Nav_Button.dart';
import 'package:taqatah/Data/Images_Data.dart';
import 'package:taqatah/Pages/Home/Home_Screen.dart';
import 'package:taqatah/Pages/Location_Status/Utils/Skip_Button.dart';

import '../../Common/Title_Subtitle.dart';
import '../../Data/Colors_Data.dart';
import 'Choose_From_Map_Screen.dart';

class AddLocationPage extends StatefulWidget {
  final String? selectedLocation;

  const AddLocationPage({super.key, this.selectedLocation});

  @override
  _AddLocationPageState createState() => _AddLocationPageState();
}

class _AddLocationPageState extends State<AddLocationPage> {
  late String locationDetails;

  @override
  void initState() {
    super.initState();
    locationDetails = widget.selectedLocation ?? "";
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      backgroundColor: appPrimaryColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SkipButton(context),
            SizedBox(height: screenHeight * 0.02),
            richTextSection(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              fontColor:
                  const Color(0xFF252B5C), // Replace with your `fontcolor`
              maxFontColor:
                  const Color(0xFF283E4A), // Replace with your `maxfontcolor`
              mainText: "Add Your",
              highlightedText: "Location",
              topPadding: 24.0, // Optional
            ),
            // Replace buildSubtitle
            richTextSection(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              fontColor:
                  const Color(0xFF252B5C), // Replace with your `fontcolor`
              maxFontColor: const Color(0xFF252B5C), // Use same for description
              mainText: "",
              highlightedText: "",
              description: "You can edit this later on your account settings.",
            ),
            SizedBox(height: screenHeight * 0.01),
            //  buildSubtitle(),
            SizedBox(height: screenHeight * 0.02),
            _buildMapContainer(context, screenWidth, screenHeight),
            SizedBox(height: screenHeight * 0.02),
            _buildLocationDetailsContainer(screenWidth),
            SizedBox(height: screenHeight * 0.05),
            navButton(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(
                      locationText: locationDetails.isNotEmpty
                          ? locationDetails
                          : "City, Country",
                    ),
                  ),
                );
              },
              height: screenHeight * 0.08, // Responsive height
              width: screenWidth * 0.7,
              color: appSecondaryColor,
              borderRadius: BorderRadius.circular(10),
              buttonText: "Next",
              textStyle: GoogleFonts.lato(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: appPrimaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMapContainer(
      BuildContext context, double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
      child: GestureDetector(
        onTap: () async {
          final selectedLocation = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const LocationPickerScreen()),
          );
          if (selectedLocation != null && mounted) {
            setState(() {
              locationDetails = selectedLocation;
            });
          }
        },
        child: Container(
          height: screenHeight * 0.4,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Stack(
              children: [
                Image.asset(
                  map_image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                _buildMapOverlayText(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMapOverlayText() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: appPrimaryColor.withOpacity(0.3),
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
        child: Center(
          child: Text(
            "Select on Map",
            style: GoogleFonts.raleway(
              fontSize: 16,
              color: textcolor,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLocationDetailsContainer(double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.06,
        vertical: screenWidth * 0.03,
      ),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: containerinnercolor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Image.asset(location_icon),
            ),
            Expanded(
              child: Text(
                locationDetails.isEmpty
                    ? "Add Location Details"
                    : locationDetails,
                style: GoogleFonts.raleway(
                  fontSize: screenWidth * 0.03,
                  color: containerinnercolor1,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Image.asset(forward_icon),
            ),
          ],
        ),
      ),
    );
  }
}
