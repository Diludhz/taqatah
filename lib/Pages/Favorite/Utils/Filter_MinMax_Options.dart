import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqatah/Data/Colors_Data.dart';
import 'package:taqatah/Data/Images_Data.dart';

class MinMaxOptionsRow extends StatefulWidget {
  @override
  _MinMaxOptionsRowState createState() => _MinMaxOptionsRowState();
}

class _MinMaxOptionsRowState extends State<MinMaxOptionsRow> {
  bool showMinDropdown = false;
  bool showMaxDropdown = false;

  // Dummy year data for dropdown
  final List<int> years = List.generate(100, (index) => 1950 + index); // 1950 to 2049
  int? selectedMinYear;
  int? selectedMaxYear;

  @override
  Widget build(BuildContext context) {
    double containerWidth = MediaQuery.of(context).size.width * 0.42;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildYearSelector(
                label: selectedMinYear?.toString() ?? 'Min',
                containerWidth: containerWidth,
                onTap: () {
                  setState(() {
                    showMinDropdown = !showMinDropdown;
                    showMaxDropdown = false; // Close Max dropdown if open
                  });
                },
              ),
              _buildYearSelector(
                label: selectedMaxYear?.toString() ?? 'Max',
                containerWidth: containerWidth,
                onTap: () {
                  setState(() {
                    showMaxDropdown = !showMaxDropdown;
                    showMinDropdown = false; // Close Min dropdown if open
                  });
                },
              ),
            ],
          ),
        ),
        if (showMinDropdown)
          _buildDropdown(
            selectedYear: selectedMinYear,
            onSelect: (year) {
              setState(() {
                selectedMinYear = year;
                showMinDropdown = false; // Close dropdown on selection
              });
            },
          ),
        if (showMaxDropdown)
          _buildDropdown(
            selectedYear: selectedMaxYear,
            onSelect: (year) {
              setState(() {
                selectedMaxYear = year;
                showMaxDropdown = false; // Close dropdown on selection
              });
            },
          ),
      ],
    );
  }

  // Widget to display Min/Max year selector
  Widget _buildYearSelector({
    required String label,
    required double containerWidth,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 38,
        width: containerWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                label,
                style: GoogleFonts.raleway(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Image.asset(drop_down_icon),
            ),
          ],
        ),
      ),
    );
  }

  // Widget to build the dropdown list
  Widget _buildDropdown({
    required int? selectedYear,
    required Function(int) onSelect,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      height: 250, // Set height for dropdown
      child: ListView.builder(
        itemCount: years.length,
        itemBuilder: (context, index) {
          final year = years[index];
          return ListTile(
            title: Text(
              year.toString(),
              style: GoogleFonts.raleway(
                fontSize: 14,
                color: year == selectedYear ? appSecondaryColor: Colors.black,
              ),
            ),
            onTap: () => onSelect(year),
          );
        },
      ),
    );
  }
}
