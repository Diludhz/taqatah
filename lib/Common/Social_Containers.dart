import 'package:flutter/widgets.dart';
import 'package:taqatah/Data/Images_Data.dart';

Widget SocialButtons(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  final iconContainerWidth = (screenWidth - 48) / 2 - 8;
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconContainer(google_logo, iconContainerWidth),
        IconContainer(apple_logo, iconContainerWidth),
      ],
    ),
  );
}

Widget IconContainer(String iconPath, double width) {
  return Container(
    height: 70,
    width: width,
    decoration: BoxDecoration(
      color: const Color(0xFFF5F4F8),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Center(child: Image.asset(iconPath, height: 40, width: 40)),
  );
}
