import 'package:flutter/material.dart';

Widget navButton({
  required double height,
  required double width,
  required Color color,
  required String buttonText,
  required TextStyle textStyle,
  required BorderRadius borderRadius,
  VoidCallback? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Center(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius,
        ),
        child: Center(
          child: Text(
            buttonText,
            style: textStyle,
          ),
        ),
      ),
    ),
  );
}
