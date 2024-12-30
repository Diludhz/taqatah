import 'package:flutter/material.dart';
import '../Data/Images_Data.dart';

Widget trashButton({
  required double width,
  required VoidCallback onTap,
}) {
  return Padding(
    padding: EdgeInsets.only(top: width * 0.02),
    child: GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: const Color(0xFFF5F4F8),
        radius: 25,
        child: Image.asset(delete_icon,height: width*0.05,),
      ),
    ),
  );
}
