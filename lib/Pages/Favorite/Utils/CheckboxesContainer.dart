import 'package:flutter/material.dart';
import 'package:taqatah/Data/Colors_Data.dart';

class CheckboxExample extends StatefulWidget {
  @override
  _CheckboxExampleState createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  // Track checkbox states
  List<bool> _checkedValues = [false, false, false, false];

  // List of text options
  final List<String> _options = [
    'Single-Family',
    'Townhomes',
    'Multi-family',
    'Condo',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(4, (index) {
        return Row(
          children: [
            // Curved container for checkbox
            Checkbox(
              value: _checkedValues[index],
              onChanged: (bool? newValue) {
                setState(() {
                  _checkedValues[index] = newValue ?? false;
                });
              },
              activeColor: appSecondaryColor, // Checkbox color when checked
              side: BorderSide(color: Colors.black), // Border color of checkbox
              materialTapTargetSize:
                  MaterialTapTargetSize.shrinkWrap, // Shrink tap area
            ),
            SizedBox(width: 10), // Space between checkbox and text
            // Text next to the checkbox with the new options list and style
            Text(
              _options[index], // Get the option text from the list
              style: TextStyle(
                fontFamily: 'Raleway', // Set font family to Raleway
                fontSize: 14, // Set font size to 14
                fontWeight: FontWeight.normal, // Normal font weight
              ),
            ),
          ],
        );
      }),
    );
  }
}
