import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:taqatah/Data/Images_Data.dart';
import '../../../Data/Colors_Data.dart';

class CustomTextfield extends StatefulWidget {
  @override
  _CustomTextfieldState createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  // List to store location suggestions
  List<dynamic> locationSuggestions = [];
  TextEditingController _controller = TextEditingController();

  // Function to fetch location suggestions
  Future<void> fetchLocationSuggestions(String query) async {
    final url = Uri.parse(
        'https://nominatim.openstreetmap.org/search?q=$query&format=json&accept-language=en');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        locationSuggestions = data;
      });
    } else {
      setState(() {
        locationSuggestions = [];
      });
      print('Error fetching location suggestions: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 75,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              color: appPrimaryColor, borderRadius: BorderRadius.circular(25)),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(textfield_serach_icon),
              ),
              Expanded(
                child: TextFormField(
                  controller: _controller,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      fetchLocationSuggestions(value);
                    } else {
                      setState(() {
                        locationSuggestions = [];
                      });
                    }
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Find Location',
                    hintStyle: GoogleFonts.raleway(
                        fontSize: 12, color: containerinnercolor1),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15, bottom: 15),
                child: VerticalDivider(color: dividergraycolor, thickness: 1),
              ),
              Image.asset(mic_icon),
            ],
          ),
        ),
        // Display location suggestions below the TextField
        if (locationSuggestions.isNotEmpty)
          Container(
            height: 200,
            color: Colors.white, // Set the background color to white
            child: ListView.separated(
              itemCount: locationSuggestions.length,
              itemBuilder: (context, index) {
                final suggestion = locationSuggestions[index];
                return ListTile(
                  title: Text(suggestion['display_name']),
                  onTap: () {
                    // Handle selection of a suggestion
                    print('Selected Location: ${suggestion['display_name']}');
                  },
                );
              },
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey, // Divider color
                thickness: 1, // Divider thickness
              ),
            ),
          ),
      ],
    );
  }
}
