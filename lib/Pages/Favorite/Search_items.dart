import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:taqatah/Data/Images_Data.dart';

import '../../Common/Back_Button.dart';
import 'Provider/Favorite_Provider.dart';
import 'Utils/Custom_Textfield.dart';
import 'Utils/Not_Found_items.dart';
import 'Utils/Sorting_Button.dart';

class SearchItemsScreen extends StatefulWidget {
  const SearchItemsScreen({super.key});

  @override
  State<SearchItemsScreen> createState() => _SearchItemsScreenState();
}

class _SearchItemsScreenState extends State<SearchItemsScreen> {
  int _selectedIcon = 0; // 0 for grid, 1 for list
  final TextEditingController _searchController = TextEditingController();

  final List<String> _ratings = [
    "4.8", "4.5", "4.7", "4.6", "4.9",
    "4.4", "4.3", "4.7", "4.6", "4.8",
    "4.2", "4.1", "4.5", "4.3", "4.6",
    "4.7", "4.4", "4.8", "4.3", "4.9",
  ];

  final List<String> _building = [
    "Atlantis, The Palm House", "Burj Al Arab Jumeirah", "Rixos The Palm Hotel & Suites",
    "Jumeirah Beach Hotel", "The Ritz-Carlton, Dubai", "Armani Hotel Dubai",
    "Sofitel Dubai The Palm", "W Dubai - The Palm", "Taj Dubai", "Fairmont The Palm",
    "Kempinski Hotel Mall of the Emirates", "Hilton Dubai Jumeirah", "Caesars Palace Bluewaters",
    "Address Boulevard", "The Oberoi Dubai Apartment", "Palazzo Versace Dubai",
    "Radisson Blu Hotel Dubai", "The St. Regis Downtown Dubai", "Mandarin Oriental Jumeira",
    "Four Seasons Resort Dubai",
  ];
  final List<String> _locations = [
    "Palm Jumeirah, Dubai",
    "Jumeirah Beach, Dubai",
    "Palm Jumeirah, Dubai",
    "Jumeirah Beach, Dubai",
    "JBR, Dubai",
    "Burj Khalifa, Dubai",
    "Palm Jumeirah, Dubai",
    "Palm Jumeirah, Dubai",
    "Business Bay, Dubai",
    "Palm Jumeirah, Dubai",
    "Sheikh Zayed Road, Dubai",
    "JBR, Dubai",
    "Bluewaters Island, Dubai",
    "Downtown Dubai, Dubai",
    "Business Bay, Dubai",
    "Culture Village, Dubai",
    "Deira Creek, Dubai",
    "Downtown Dubai, Dubai",
    "Jumeirah, Dubai",
    "Jumeirah Beach, Dubai"
  ];

  final List<String> _prices = List.generate(20, (index) => "${200 + index}");
  final List<String> _imageUrl = List.generate(20, (index) => near_rest_4);
  String _getRandomPricingOption() {
    final random = Random();
    List<String> options = [
      '/month',       // Show only month
      '/year',        // Show only year

    ];
    return options[random.nextInt(options.length)];
  }


  List<int> _filteredIndexes = [];

  @override
  void initState() {
    super.initState();
    _filteredIndexes = List.generate(_building.length, (index) => index);
    _searchController.addListener(_filterProperties);
  }

  void _filterProperties() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredIndexes = List.generate(_building.length, (index) => index);
      } else {
        _filteredIndexes =
            List.generate(_building.length, (index) => index).where((index) {
          return _building[index].toLowerCase().contains(query) ||
              _prices[index].contains(query);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    //  double screenHeight = MediaQuery.of(context).size.height;
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: backButton(
                  width: screenWidth,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Text(
                "Search results",
                style: GoogleFonts.lato(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              filterButton(context),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 10, top: 10),
            child: favoriteCustomTextField(
              hintText: 'Search by name or price',
              iconPath: textfield_serach_icon,
              controller: _searchController,
              // No prefixIconPath provided
            ),
          ),
          _buildResultsInfoAndViewSwitch(),
          _selectedIcon == 0
              ? _buildGridView(favoriteProvider)
              : _buildListView(favoriteProvider),
        ],
      ),
    );
  }

  Widget _buildResultsInfoAndViewSwitch() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              'Found ${_filteredIndexes.length} estates',
              style: GoogleFonts.raleway(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF283E4A),
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            height: 40,
            width: 96,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(100)),
            child: Row(
              children: [
                IconButton(
                  icon: Image.asset(
                    grid_menu_icon,
                    color: _selectedIcon == 0
                        ? const Color.fromARGB(255, 189, 103, 204)
                        : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _selectedIcon = 0;
                    });
                  },
                ),
                IconButton(
                  icon: Image.asset(
                    list_view_icon,
                    color: _selectedIcon == 1
                        ? const Color.fromARGB(255, 196, 125, 209)
                        : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _selectedIcon = 1;
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

  Widget _buildGridView(FavoriteProvider favoriteProvider) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: _filteredIndexes.isEmpty
          ? const NotFound() // Display NotFound when no items are available
          : GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _filteredIndexes.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
              ),
              itemBuilder: (context, index) {
                int itemIndex = _filteredIndexes[index];
                return _buildPropertyGridCard(itemIndex, favoriteProvider);
              },
            ),
    );
  }


  Widget _buildListView(FavoriteProvider favoriteProvider) {
    return _filteredIndexes.isEmpty
        ? const NotFound() // Display NotFound when no items are available
        : ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: _filteredIndexes.length,
            itemBuilder: (context, index) {
              int itemIndex = _filteredIndexes[index];
              return _buildPropertyListCard(itemIndex, favoriteProvider);

            },
          );
  }

  Widget _buildPropertyGridCard(int index, FavoriteProvider favoriteProvider) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      elevation: 4,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.all(8),
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                    _imageUrl[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 17,
                right: 17,
                child: GestureDetector(
                  onTap: () => favoriteProvider.toggleFavorite(index),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 15,
                    child: Icon(
                      favoriteProvider.isFavorite(index)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.red,
                      size: 18,
                    ),
                  ),
                ),
              ),


    Positioned(
    bottom: 17,
    right: 17,
    child: Container(
    height: 25,
    width: 90, // Adjusted width for dynamic text
    decoration: BoxDecoration(
    color: const Color(0xFF1F4C6B).withOpacity(0.6),
    borderRadius: BorderRadius.circular(10),
    ),
    alignment: Alignment.center,
    child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text(
    '\$${_prices[index]}',
    style: GoogleFonts.raleway(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 12,
    ),
    ),
    const SizedBox(width: 4),
    Text(
    _getRandomPricingOption(), // Dynamic pricing option
    style: GoogleFonts.montserrat(
    color: Colors.white,
    fontSize: 8,

    ),
    ),
    ],
    ),
    ),
    ),

    ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _building[index],
                  style: GoogleFonts.raleway(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(star_icon),
                      //  SizedBox(width: 5),
                        Text(
                          _ratings[index],
                          style: GoogleFonts.raleway(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        //SizedBox(width:10),

                      ],
                    ),


                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Image.asset(location_icon),
                    // SizedBox(width:5),
                    Text(_locations[index],style: GoogleFonts.raleway(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey
                    ),),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPropertyListCard(int index, FavoriteProvider favoriteProvider) {
    return Padding(
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
              height: 120,
              width: 120,
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
                  // Favorite icon on top left
                  Positioned(
                    top: 7,
                    left: 7,
                    child: GestureDetector(
                      onTap: () => favoriteProvider.toggleFavorite(index),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 15,
                        child: Icon(
                          favoriteProvider.isFavorite(index)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.red,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                  // Price container on bottom left
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
                        "Apartment",
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
                      "Location On ${_building[index]}",
                      style: GoogleFonts.raleway(
                        fontSize: 10,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                           Image.asset(star_icon),
                            SizedBox(width: 5),
                            Text(
                              _ratings[index],
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Apartment",
                          style: GoogleFonts.raleway(
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height:10),
                    Row(
                      children: [
                        Text(
                          '\$${_prices[index]} ', // Price with dollar sign and duration
                          style: GoogleFonts.raleway(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "/months", // Price with dollar sign and duration
                          style: GoogleFonts.raleway(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
