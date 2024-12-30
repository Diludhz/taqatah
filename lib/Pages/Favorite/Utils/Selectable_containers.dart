import 'package:flutter/material.dart';
import 'package:taqatah/Data/Colors_Data.dart';

class SelectableContainersExample extends StatefulWidget {
  final String categoryToShow;

  // Pass the category to display via the constructor
  SelectableContainersExample({required this.categoryToShow});

  @override
  _SelectableContainersExampleState createState() =>
      _SelectableContainersExampleState();
}

class _SelectableContainersExampleState
    extends State<SelectableContainersExample> {
  final Map<String, List<String>> _categories = {
    'Category 1': ['Any', '0.0', '1.0', '1.5', '2.0', '2.5', '3+'],
    'Category 2': ['Any', '1', '2', '3', '4', '5+'],
  };

  final Map<String, List<bool>> _selectionStates = {
    'Category 1': List.filled(7, false),
    'Category 2': List.filled(6, false),
  };

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

    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: List.generate(labels.length, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    // Toggle the selection state of the clicked container
                    selectionStates[index] = !selectionStates[index];
                  });
                },
                child: Container(
                  height: 32,
                  width: 52,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: selectionStates[index]
                        ? appSecondaryColor
                        : Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color:
                          selectionStates[index] ? Colors.white : Colors.grey,
                    ),
                  ),
                  child: Text(
                    labels[index],
                    style: TextStyle(
                      color:
                          selectionStates[index] ? Colors.white : Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
