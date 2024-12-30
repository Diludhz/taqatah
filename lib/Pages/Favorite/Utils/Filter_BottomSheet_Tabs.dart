import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqatah/Data/Colors_Data.dart';

class TabsWidget extends StatefulWidget {
  final List<String> tabLabels;  // List of tab labels (e.g., ['Yearly', 'Monthly'])
  final Function(int) onTabSelected;  // Callback for tab selection

  TabsWidget({
    required this.tabLabels,
    required this.onTabSelected,
  });

  @override
  _TabsWidgetState createState() => _TabsWidgetState();
}

class _TabsWidgetState extends State<TabsWidget> {
  // Track selected tab index
  int _selectedIndex = 0;

  // Function to handle tab selection
  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onTabSelected(index);  // Call the passed callback function when tab is selected
  }

  // Helper function to build each tab
  Widget _buildTab(String text, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _onTabSelected(index), // On tap, set selected index
        child: Container(
          height: 38,
          decoration: BoxDecoration(
            color: _selectedIndex == index ? appSecondaryColor : Colors.transparent,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.raleway(
                fontSize: 14,
                fontWeight: FontWeight.w500, // Medium weight
                color: _selectedIndex == index ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 38, // Container height
        width: screenWidth, // Full width of the screen
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100), // Rounded corners
          border: Border.all(color: Colors.grey.shade300), // Border color
        ),
        child: Row(
          children: [
            for (int i = 0; i < widget.tabLabels.length; i++)
              _buildTab(widget.tabLabels[i], i),  // Calling the function for each tab dynamically
          ],
        ),
      ),
    );
  }
}
