import 'package:flutter/material.dart';
import 'package:taqatah/Data/Colors_Data.dart';

class RangeSliderTutorial extends StatefulWidget {
  const RangeSliderTutorial({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _RangeSliderTutorialState createState() => _RangeSliderTutorialState();
}

class _RangeSliderTutorialState extends State<RangeSliderTutorial> {
  double start = 30.0;
  double end = 50.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Custom Labels above the slider
        Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${start.toStringAsFixed(0)}',
                style: TextStyle(
                  color: appSecondaryColor, // Custom color for label
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '\$${end.toStringAsFixed(0)}',
                style: TextStyle(
                  color: appSecondaryColor, // Custom color for label
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8), // Add spacing between labels and slider
        // Range Slider
        RangeSlider(
          values: RangeValues(start, end),
          onChanged: (value) {
            setState(() {
              start = value.start;
              end = value.end;
            });
          },
          min: 0.0,
          max: 10000.0, // Adjust max value for $10B
          divisions: 100, // Optional: Adjust for discrete steps
          activeColor: appSecondaryColor, // Customize active range color
          inactiveColor: Colors.grey.shade500, // Customize inactive range color
        ),
      ],
    );
  }
}
