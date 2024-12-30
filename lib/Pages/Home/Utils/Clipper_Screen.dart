import 'package:flutter/material.dart';

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(size.width, 0); // Start from the top-right corner
    path.lineTo(size.width,
        size.height - 120); // Draw down to the point 90 units from the bottom

    var controlPoint =
        Offset(size.width - 50, size.height); // Control point for the curve
    var endPoint =
        Offset(size.width / 2, size.height); // End point for the curve

    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(0, size.height); // Draw to the bottom-left corner
    path.lineTo(0, 0); // Close the path back to the top-left corner
    path.close(); // Close the path

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
