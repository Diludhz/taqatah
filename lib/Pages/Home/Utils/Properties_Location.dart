import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';

import '../../../Common/Back_Button.dart';
import '../../../Data/Colors_Data.dart';
import '../../../Data/Images_Data.dart';
import '../../Location_Status/Utils/Custom_Textfield.dart';
import '../../Location_Status/Utils/Floating_Button.dart';

class PropertiesLocation extends StatefulWidget {
  const PropertiesLocation({super.key});

  @override
  State<PropertiesLocation> createState() => _PropertiesLocationState();
}

class _PropertiesLocationState extends State<PropertiesLocation> {
  LatLong? pickedLocation; // Variable to hold the picked location


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          FlutterLocationPicker(
            initZoom: 8,
            minZoomLevel: 5,
            maxZoomLevel: 16,
            trackMyPosition: true,
            showZoomController: false,
            showLocationController: false,
            mapLanguage: 'en',
            showSearchBar: false,
            showSelectLocationButton: false,
            showCurrentLocationPointer: false,
            onError: (e) => print(e),
            onPicked: (pickedData) => setState(() {}),
            onChanged: (pickedData) => setState(() {}),
            showContributorBadgeForOSM: true,
          ),
          // Back Button Positioned
          Positioned(
            top: screenHeight * 0.04,
            left: screenWidth * 0.06,
            child: backButton(
              width: screenWidth,
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            top: screenHeight * 0.13,
            left: screenWidth * 0.06,
            right: screenWidth * 0.06,
            child: CustomTextfield(),
          ),
          Positioned(
            bottom: screenHeight * 0.29,
            right: screenWidth * 0.08,
            child: floatingButton(),
          ),
          Positioned(
            bottom: screenHeight * 0.13,
            left: screenWidth * 0.06,
            right: screenWidth * 0.06,
            child: _buildLocationDetail(),
          ),
          Positioned(
            bottom: screenHeight * 0.03,
            left: screenWidth * 0.06,
            right: screenWidth * 0.06,
            child: _buildChooseButton(context),
          ),
        ],
      ),
    );
  }
}


Widget _buildLocationDetail() {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(25),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Location Detail',
            style:
            GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Row(
          children: [
            CircleAvatar(
              backgroundColor: containerinnercolor,
              radius: 25,
              child: Image.asset(pin_icon),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
               "Jl. Pandanaran, Semarang Tengah, Semarang City, Central Java 50241",
                style: GoogleFonts.lato(
                    fontSize: 14, color: containerinnercolor1),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _buildChooseButton(BuildContext context) {
  return GestureDetector(
    onTap: (){},
    child: Container(
      height: 63,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: appSecondaryColor, borderRadius: BorderRadius.circular(15)),
      child: Text(
        'Choose Line',
        style: GoogleFonts.lato(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: appPrimaryColor),
      ),
    ),
  );
}
