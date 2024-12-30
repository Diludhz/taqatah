import 'package:flutter/material.dart';
import 'package:taqatah/Data/Images_Data.dart';

import '../../../Data/Colors_Data.dart';

class TabsSelection extends StatefulWidget {
  const TabsSelection({super.key});

  @override
  _TabsSelectionState createState() => _TabsSelectionState();
}

class _TabsSelectionState extends State<TabsSelection> {
  int selectedIndex = 0; // Default to the first tab ("View All")

  final List<String> texts = ['View All', 'Type', 'Categories', 'Price'];

  // Helper function to navigate to different pages
  void _navigateToPage(int index) {
    switch (index) {
      case 0:
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => const HomeScreen()),
        // );
        break;
      case 1:
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => const TypePage()),
        // );
        break;
      case 2:
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => const CategoriesPage()),
        // );
        break;
      case 3:
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => const PricePage()),
        // );
        break;
      // case 4: // For the asset container
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => const FilterPage()),
      //   );
      //   break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 24, top: 4, bottom: 12),
        child: Row(
          children: [
            ...List.generate(texts.length, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index; // Update selected index
                  });
                  _navigateToPage(index); // Navigate to the page
                },
                child: Container(
                  height: 47,
                  width: 89,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: selectedIndex == index
                        ? maxfontcolor
                        : containerinnercolor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    texts[index],
                    style: TextStyle(
                        color: selectedIndex == index
                            ? appPrimaryColor
                            : maxfontcolor),
                  ),
                ),
              );
            }),
            // New container with an asset
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex =
                      texts.length; // Update selected index for the asset
                });
                _navigateToPage(texts.length); // Navigate to the filter page
              },
              child: Container(
                height: 47,
                width: 89,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: selectedIndex == texts.length
                      ? maxfontcolor
                      : appPrimaryColor,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: textcolor,
                  ),
                ),
                alignment: Alignment.center,
                child: Image.asset(filter_icon, // Replace with your asset path
                    width: 24,
                    height: 24,
                    color: selectedIndex == texts.length
                        ? appPrimaryColor
                        : maxfontcolor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
