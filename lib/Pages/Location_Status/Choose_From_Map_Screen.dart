import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';
import 'package:taqatah/Data/Images_Data.dart';
import 'package:taqatah/Pages/Location_Status/Utils/Custom_Textfield.dart';
import '../../Data/Colors_Data.dart';
import '../../common/back_button.dart';
import 'Add_Location_Screen.dart';
import 'Utils/Floating_Button.dart';

class LocationPickerScreen extends StatefulWidget {
  const LocationPickerScreen({super.key});

  @override
  _LocationPickerScreenState createState() => _LocationPickerScreenState();
}

class _LocationPickerScreenState extends State<LocationPickerScreen> {
  String selectedLocation = 'Where you standing area select it';
  LatLong? currentLatLong;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    setState(() {
      currentLatLong = const LatLong(25.276987, 55.296249); // Example location
    });
  }

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
            onPicked: (pickedData) => setState(() {
              selectedLocation = 'Selected Location: ${pickedData.address}';
            }),
            onChanged: (pickedData) => setState(() {
              selectedLocation = pickedData.address;
            }),
            showContributorBadgeForOSM: true,
          ),
          Positioned(
            top: screenHeight * 0.04,
            left: screenWidth * 0.06,
            child: backButton(width: screenWidth, onTap: () {}),
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
                  selectedLocation,
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
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                AddLocationPage(selectedLocation: selectedLocation)),
      ),
      child: Container(
        height: 63,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: appSecondaryColor, borderRadius: BorderRadius.circular(15)),
        child: Text(
          'Choose Your Location',
          style: GoogleFonts.lato(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: appPrimaryColor),
        ),
      ),
    );
  }
}
