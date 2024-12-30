import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqatah/Data/Colors_Data.dart';
import 'package:taqatah/Data/Images_Data.dart';
import 'package:taqatah/Pages/Home/Utils/Properties_Location.dart';

import 'Utils/Property_Details_Screen.dart';

class HomeMenuScreen extends StatefulWidget {
  const HomeMenuScreen({super.key});

  @override
  State<HomeMenuScreen> createState() => _HomeMenuScreenState();
}

class _HomeMenuScreenState extends State<HomeMenuScreen> {
  final List<String> _imageUrl = [
    properties_img_1,
    properties_img_2,
    properties_img_3,
    properties_img_4,
    properties_img_1,
    properties_img_2,
  ];

  final List<String> _building = [
    'Bridgeland Modern House',
    'Wayside Modern House',
    'Shoolview House',
    'Shoolview House',
    'Bridgeland Modern House',
    'Wayside Modern House',
  ];

  final List<String> _ratings = ['4.5', '4.2', '4.8', '4.5', '4.2', '4.8'];

  final List<String> _prices = [
    '\$200',
    '\$300',
    '\$250',
    '\$150',
    '\$180',
    '\$220',
  ];

  final Set<int> _favoriteItems = {};
  bool _isListView = true; // Toggles between ListView and GridView

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Column(
            children: [
              Center(
                child: Text(
                  "Properties",
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
              _buildListViewAndGridViewSwitch(),
              Expanded(
                child: _isListView
                    ? ListView.builder(
                        itemCount: _imageUrl.length,
                        itemBuilder: (context, index) {
                          return _buildPropertiesListCard(index);
                        },
                      )
                    : GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.7,
                        ),
                        itemCount: _imageUrl.length,
                        padding: const EdgeInsets.all(8.0),
                        itemBuilder: (context, index) {
                          return _buildPropertiesGridCard(index);
                        },
                      ),
              ),
            ],
          ),
          Positioned(
            bottom: 18,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PropertiesLocation()));
                },
                child: Container(
                  height: 34,
                  width: 105,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Map",
                        style: GoogleFonts.roboto(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 7),
                      Image.asset(
                        stack_map_icon, // Replace with your asset path
                        height: 20,
                        width: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _buildListViewAndGridViewSwitch() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 40,
            width: 96,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: Image.asset(
                    grid_menu_icon,
                    color: _isListView
                        ? Colors.grey
                        : appSecondaryColor, // Change color based on selection
                    height: 24,
                    width: 24,
                  ),
                  onPressed: () {
                    setState(() {
                      _isListView = false;
                    });
                  },
                ),
                IconButton(
                  icon: Image.asset(
                    list_view_icon,
                    color: _isListView
                        ? appSecondaryColor
                        : Colors.grey, // Change color based on selection
                    height: 24,
                    width: 24,
                  ),
                  onPressed: () {
                    setState(() {
                      _isListView = true;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPropertiesListCard(int index) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PropertyDetailsScreen(
              buildingName: _building[index],
              imageUrl: _imageUrl[index],
              rating: _ratings[index],
              price: _prices[index],
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.all(8),
                height: 140,
                width: 168,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        _imageUrl[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                    Positioned(
                      top: 7,
                      left: 7,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_favoriteItems.contains(index)) {
                              _favoriteItems.remove(index);
                            } else {
                              _favoriteItems.add(index);
                            }
                          });
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 15,
                          child: Icon(
                            _favoriteItems.contains(index)
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.red,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          "House",
                          style: GoogleFonts.raleway(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _building[index],
                        style: GoogleFonts.raleway(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Location for ${_building[index]}",
                        style: GoogleFonts.raleway(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 7, vertical: 3),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 10,
                                ),
                                Text(
                                  _ratings[index],
                                  style: GoogleFonts.raleway(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "House",
                            style: GoogleFonts.raleway(
                              fontSize: 10,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: _prices[index],
                              style: GoogleFonts.montserrat(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: "/month",
                              style: GoogleFonts.montserrat(
                                fontSize: 8,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPropertiesGridCard(int index) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.asset(
                _imageUrl[index],
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              _building[index],
              style: GoogleFonts.raleway(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              _prices[index],
              style: GoogleFonts.raleway(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
