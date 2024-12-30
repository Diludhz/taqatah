import 'package:flutter/material.dart';
import '../../../Data/Images_Data.dart';
import 'Filter_Bottom_Sheet.dart';

Widget filterButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
      onTap: () {
        // Show bottom sheet on tap
        showModalBottomSheet(
          context: context,
          isScrollControlled: true, // Makes the bottom sheet height flexible
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (BuildContext context) {
            return FractionallySizedBox(
              heightFactor: 0.9, // Bottom sheet height (3/4 of the screen)
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: filterBottomSheetContent(context),
              ),
            );
          },
        );
      },
      child: Align(
        alignment: Alignment.topLeft,
        child: CircleAvatar(
          backgroundColor: const Color(0xFFF5F4F8),
          radius: 25,
          child: Image.asset(sorting_icon),
        ),
      ),
    ),
  );
}
