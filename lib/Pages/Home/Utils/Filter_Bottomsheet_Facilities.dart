import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqatah/Data/Colors_Data.dart';
import 'package:taqatah/Data/Images_Data.dart';

class FilterFaciliticesContainer extends StatefulWidget {
  final String categoryToShow;

  FilterFaciliticesContainer({required this.categoryToShow});

  @override
  _FilterFaciliticesContainerState createState() =>
      _FilterFaciliticesContainerState();
}

class _FilterFaciliticesContainerState
    extends State<FilterFaciliticesContainer> {
  final Map<String, List<String>> _categories = {
    'Category 1': [
      "Car Parking",
      "Swimming",
      "Gym & Fit",
      "Restaurant",
      "Wifi",
      "Pet Center",
      "Sports",
      "Laundry",
    ],
  };

  final Map<String, List<bool>> _selectionStates = {
    'Category 1': List.filled(8, false),
  };

  final List<String> _images = [
    parking_lot_icon,
    swimming_icon,
    gym_icon,
    hotel_icon,
    wifi_icon,
    pet_icon,
    run_icon,
    loundry,
  ];

  @override
  Widget build(BuildContext context) {
    // Extract the selected category
    final labels = _categories[widget.categoryToShow];
    final selectionStates = _selectionStates[widget.categoryToShow];

    if (labels == null || selectionStates == null) {
      return Center(
        child: Text('Invalid category selected!'),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: List.generate(8, (index) {
            // Display only 4 containers
            double containerHeight = 64.0;
            double containerWidth = 87.0;

            return GestureDetector(
              onTap: () {
                setState(() {
                  // Toggle the selection state of the clicked container
                  selectionStates[index] = !selectionStates[index];
                });
              },
              child: Container(
                height: containerHeight,
                width: containerWidth,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: selectionStates[index]
                      ? appSecondaryColor
                      : Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: selectionStates[index] ? Colors.white : Colors.grey,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icon or image with dynamic color based on selection
                    Image.asset(
                      _images[index],
                      height: 24,
                      width: 24,
                      color: selectionStates[index]
                          ? Colors.white
                          : appSecondaryColor,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      labels[index],
                      style: GoogleFonts.poppins(
                        color: selectionStates[index]
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
