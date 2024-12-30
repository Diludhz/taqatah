import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:swipeable_tile/swipeable_tile.dart';
import 'package:taqatah/Common/Back_Button.dart';
import 'package:taqatah/Data/Images_Data.dart';
import '../../Common/Trash_Button.dart';
import '../Favorite/Provider/Favorite_Provider.dart';
import '../Favorite/Utils/Not_Found_items.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  int _selectedIcon = 0; // Default selection for grid view

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    //double screenHeight = MediaQuery.of(context).size.height;
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    List<int> favoriteIndexes = favoriteProvider.favoriteIndexes;

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                backButton(
                    width: screenWidth,
                    onTap: () {
                      Navigator.pop(context);
                    }),
                Text(
                  "My Favorites",
                  style: GoogleFonts.lato(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trashButton(width: screenWidth, onTap: () {})
              ],
            ),
          ),
          const SizedBox(height: 20),
          _buildResultsInfoAndViewSwitch(favoriteIndexes.length),
          _selectedIcon == 0
              ? _buildGridView(favoriteIndexes)
              : _buildListView(favoriteIndexes),
        ],
      ),
    );
  }

  Widget _buildResultsInfoAndViewSwitch(int itemCount) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              '$itemCount estates',
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
              borderRadius: BorderRadius.circular(100),
            ),
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

  Widget _buildGridView(List<int> favoriteIndexes) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: favoriteIndexes.isEmpty
          ? const NotFound() // Display NotFound when no items are available
          : GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: favoriteIndexes.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.65,
        ),
        itemBuilder: (context, index) {
          int itemIndex = favoriteIndexes[index];
          return _buildPropertyGridCard(itemIndex);
        },
      ),
    );
  }

  Widget _buildListView(List<int> favoriteIndexes) {
    return favoriteIndexes.isEmpty
        ? const NotFound() // Display NotFound when no items are available
        : ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: favoriteIndexes.length,
      itemBuilder: (context, index) {
        int itemIndex = favoriteIndexes[index];
        return _buildPropertyListCard(itemIndex);
      },
    );
  }

  Widget _buildPropertyGridCard(int index) {
    // Replace with your actual data retrieval logic
    String imageUrl = near_rest_4; // Example image
    String buildingName = "Building ${index + 1}"; // Example building name
    String price = "\$${200 + index}"; // Example price
    String rating = "4.${9 - (index % 5)}"; // Example rating

    bool isFavorited = true; // Track favorite status

    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Card(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
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
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Favorite icon
                  Positioned(
                    top: 17,
                    right: 17,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isFavorited = !isFavorited; // Toggle favorite status
                        });
                      },
                      child: CircleAvatar(
                        backgroundColor:
                        isFavorited ? Colors.red : Colors.white,
                        radius: 16,
                        child: Icon(
                          isFavorited ? Icons.favorite : Icons.favorite_border,
                          color: isFavorited ? Colors.white : Colors.black,
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
                      width: 74,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1F4C6B).withOpacity(0.6),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            price,
                            style: GoogleFonts.raleway(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '/month',
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
                      buildingName,
                      style: GoogleFonts.raleway(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Location for $buildingName",
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
                                rating,
                                style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<String> items = List.generate(10, (index) => 'Building ${index + 1}');
  bool isFavorited = true;


  Widget _buildPropertyListCard(int index) {
    String imageUrl = "assets/images/img_near2.png"; // Example image
    String buildingName = items[index]; // Use the actual list
    String price = "\$${200 + index}"; // Example price
    String rating = "4.${9 - (index % 5)}"; // Example rating

    return Padding(
      padding: const EdgeInsets.only(left: 12,right: 12,top: 7,bottom: 7),
      child: SwipeableTile(

        key: ValueKey(items[index]),
        onSwiped: (direction) {
          setState(() {
            items.removeAt(index);
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('$buildingName dismissed'),
            ),
          );
        },
        backgroundBuilder: (BuildContext context, SwipeDirection direction, AnimationController progress) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.red, // Color when swiped
                borderRadius: BorderRadius.circular(25)

            ),
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Icon(Icons.delete, color: Colors.white),
            ),
          );
        },
        color: Colors.grey.shade100,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Row(
            children: [
              // Image container with favorite icon
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.all(8),
                    height: 140,
                    width: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Favorite icon positioned at top-left
                  Positioned(
                    top: 15,
                    left: 15,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isFavorited = !isFavorited; // Toggle favorite status
                        });
                      },
                      child: CircleAvatar(
                        backgroundColor:
                        isFavorited ? Colors.red : Colors.white,
                        radius: 16,
                        child: Icon(
                          isFavorited
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: isFavorited ? Colors.white : Colors.black,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 3),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1F4C6B).withOpacity(0.6),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Apartment',
                        style: GoogleFonts.raleway(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Details column
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Building name
                      Text(
                        buildingName,
                        style: GoogleFonts.raleway(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Location text
                      Text(
                        "Location for $buildingName",
                        style: GoogleFonts.raleway(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Rating and Apartment text in container
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Rating
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
                                  rating,
                                  style: GoogleFonts.raleway(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      // Price with "per month"
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: price, // Main price text (e.g., "$200")
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: const Color(0xFF283E4A),
                              ),
                            ),
                            TextSpan(
                              text: " /month", // " /month" suffix
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
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
}