import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqatah/Common/Nav_Button.dart';
import 'package:taqatah/Common/Row_With_Space.dart';
import 'package:taqatah/Data/Colors_Data.dart';
import 'package:taqatah/Pages/Favorite/Utils/Filter_BottomSheet_Tabs.dart';
import '../../../Common/Edit_Reset_TextContainers.dart';
import '../../../Data/Images_Data.dart';
import '../../Home/Utils/Filter_Bottomsheet_Facilities.dart';
import 'CheckboxesContainer.dart';
import 'Custom_Textfield.dart';
import 'Filter_MinMax_Container.dart';
import 'Filter_MinMax_Options.dart';
import 'Price_Range_Slider.dart';
import 'Selectable_containers.dart';

Widget filterBottomSheetContent(BuildContext context) {
  double screenHeight = MediaQuery.of(context).size.height;
  double screenWidth = MediaQuery.of(context).size.width;
  final TextEditingController _searchController = TextEditingController();
  void _handleTabSelection(int index) {
    // You can perform navigation here based on selected tab index
    if (index == 0) {
      // Navigate to Home or perform any other action
      print('Yearly Tab selected');
      // Example: Navigator.pushNamed(context, '/yearly');
    } else if (index == 1) {
      // Navigate to Monthly or perform any other action
      print('Monthly Tab selected');
      // Example: Navigator.pushNamed(context, '/monthly');
    }
  }

  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Dragging handle
          Center(
            child: Container(
              width: 70,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: editResetTextContainer(
                titleText: "Filter",
                buttonText: "Reset",
                onButtonPressed: () {},
                screenWidth: screenWidth),
          ),
          const RowWithTextButton(
            leftText: "Location",
          ),
          favoriteCustomTextField(
            hintText: 'Search by name or price',
            iconPath: textfield_serach_icon,
            controller: _searchController,
            prefixIconPath: location_icon, // Prefix icon provided
          ),
          const RowWithTextButton(
            leftText: "Rental Period",
          ),
          TabsWidget(
            tabLabels: ['Yearly', 'Monthly'], // Pass the list of labels
            onTabSelected: _handleTabSelection, // Handle the tab selection
          ),
          const RowWithTextButton(
            leftText: "Property type",
          ),
          TabsWidget(
            tabLabels: ['Residentail', 'Commerical'], // Pass the list of labels
            onTabSelected: _handleTabSelection, // Handle the tab selection
          ),
          const SizedBox(height: 10),
          CheckboxExample(),
          const RowWithTextButton(
            leftText: "Furnished type",
          ),
          TabsWidget(
            tabLabels: ['Furnished', 'Unfurnished'], // Pass the list of labels
            onTabSelected: _handleTabSelection, // Handle the tab selection
          ),
          const RowWithTextButton(
            leftText: "Bathrooms",
          ),
          SelectableContainersExample(categoryToShow: 'Category 1'),
          const RowWithTextButton(
            leftText: "Bedrooms",
          ),
          SelectableContainersExample(categoryToShow: 'Category 2'),
          const RowWithTextButton(
            leftText: "Price range",
          ),
          MinMaxInputRow(),
          const RangeSliderTutorial(
            title: '',
          ),
          const RowWithTextButton(
            leftText: "Square feet",
          ),
          MinMaxInputRow(),
          const RangeSliderTutorial(
            title: '',
          ),
          const RowWithTextButton(
            leftText: "Year built",
          ),
          MinMaxOptionsRow(),
          const RowWithTextButton(
            leftText: "Environment / Facilities",
          ),
          FilterFaciliticesContainer(
            categoryToShow: 'Category 1',
          ),
          SizedBox(height:screenHeight*0.07),
          navButton(
              onTap: () {
                Navigator.pop(context);
              },
              height: screenHeight * 0.08,
              width: 274,
              color: appSecondaryColor,
              buttonText: "Apply Filter",
              textStyle: GoogleFonts.lato(fontSize: 18, color: appPrimaryColor),
              borderRadius: BorderRadius.circular(15))
        ],
      ),
    ),
  );
}
