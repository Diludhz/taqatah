import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqatah/Common/Edit_Reset_TextContainers.dart';

Future<void> showLocationBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    isScrollControlled: true, // Enable scrolling if content exceeds height
    builder: (context) {
      return LocationBottomSheet(); // Use the StatefulWidget here
    },
  );
}

class LocationBottomSheet extends StatefulWidget {
  const LocationBottomSheet({super.key});

  @override
  _LocationBottomSheetState createState() => _LocationBottomSheetState();
}

class _LocationBottomSheetState extends State<LocationBottomSheet> {
  int? selectedLocationIndex = 0;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: screenHeight * 0.55, // Make the bottom sheet height responsive
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            editResetTextContainer(
            titleText: "Select Location",
                buttonText: "Edit",
                onButtonPressed: (){},
                screenWidth: screenWidth),
            const SizedBox(height: 30),
            _buildLocationItem(
              context,
              0,
              'Srengseng, Kembangan, West Jakarta City, Jakarta 11630',
            ),
            const SizedBox(height: 8),
            _buildLocationItem(
              context,
              1,
              'Petompon, Kec. Gajahmungkur, Kota Semarang, Jawa Tengah 50232',
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () {
                setState(() {
                  // Show loading indicator
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Color(0xFF612C8C), // Purple color
                        ),
                      );
                    },
                  );

                  // Simulate some processing
                  Future.delayed(const Duration(seconds: 2), () {
                    Navigator.of(context).pop(); // Dismiss the loading dialog
                    Navigator.of(context).pop(); // Dismiss the bottom sheet

                    // Navigate to homepage or perform other actions if needed
                  });
                });
              },
              child: Container(
                height: screenHeight *
                    0.08, // Adjust button height based on screen height
                width: screenWidth *
                    0.7, // Adjust button width based on screen width
                decoration: BoxDecoration(
                  color: const Color(0xFF612C8C), // Purple color
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Choose Location',
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: screenWidth *
                        0.045, // Adjust text size based on screen width
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationItem(BuildContext context, int index, String location) {
    bool isSelected = selectedLocationIndex == index;
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedLocationIndex = index; // Update the selected location
          });
        },
        child: Container(
          height: 80,
          width: double.infinity,
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF283E4A) : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            leading: Container(
              height: 50,
              width: 50, // Ensure width is also set for a perfect circle
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? Colors.grey : Colors.white,
              ),
              child: Center(
                // Center the icon within the circular container
                child: Icon(
                  Icons.location_on,
                  color: isSelected ? Colors.white : Colors.indigo,
                  size: 24, // You can adjust the icon size as needed
                ),
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                location,
                style: GoogleFonts.raleway(
                  color: isSelected ? Colors.white : Colors.black87,
                  fontSize: screenWidth *
                      0.035, // Adjust text size based on screen width
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
