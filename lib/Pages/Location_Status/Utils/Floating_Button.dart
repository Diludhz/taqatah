import 'package:flutter/material.dart';
import 'package:taqatah/Data/Images_Data.dart';

Widget floatingButton() {
  return FloatingActionButton(
    shape: const CircleBorder(),
    onPressed: () {},
    backgroundColor: const Color.fromARGB(255, 31, 77, 107),
    child: Image.asset(floating_button, fit: BoxFit.cover),
  );
}
