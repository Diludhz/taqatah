import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqatah/Common/Nav_Button.dart';
import 'package:taqatah/Data/Colors_Data.dart';
import 'package:taqatah/Data/Images_Data.dart';

import '../../../Common/Back_Button.dart';
import '../../Favorite/Utils/Sorting_Button.dart';
import '../../Home/Utils/Custom_Gridview.dart';

class PropertyDetailsScreen extends StatefulWidget {
  final String buildingName, imageUrl, rating, price;

  const PropertyDetailsScreen({
    Key? key,
    required this.buildingName,
    required this.imageUrl,
    required this.rating,
    required this.price,
  }) : super(key: key);

  @override
  State<PropertyDetailsScreen> createState() => _PropertyDetailsScreenState();
}

class _PropertyDetailsScreenState extends State<PropertyDetailsScreen> {
  final List<bool> favoriteStatus = List.generate(20, (index) => false);

  void toggleFavorite(int index) {
    setState(() {
      favoriteStatus[index] = !favoriteStatus[index];
    });
  }
  final List<String> ratings = [
    "4.9",
    "4.8",
    "4.7",
    "4.9",
  ];
  final List<String> building = [
    "Wings Tower",
    "Mill Sper House",
    "Bungalow House",
    "Sky Dandelions Apartments"
  ];
  final List<String> prices = [
    "220",
    "271",
    "235",
    "290",
  ];
  final List<String> imageUrl = [
    near_rest_1,
    near_rest_2,
    near_rest_3,
    near_rest_4
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Main content of the page wrapped in a scrollable widget
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    _buildMainImage(),
                    _buildTopRow(context),
                    _buildBottomRow(),
                    _buildRightColumn(),
                    _buildPropertyDetails(),
                  ],
                ),
                _buildPropertyInfo(),
              ],
            ),
          ),

          // "Buy Now" button at the bottom of the screen
          Positioned(
            bottom: 21,
            left: 0,
            right: 0,
            child:navButton(
                height: 63,
                width: 278,
                color: appSecondaryColor,
                buttonText: "Buy Now",
                textStyle: GoogleFonts.lato(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: appPrimaryColor
                ),
                borderRadius: BorderRadius.circular(10)
            )
              ),




        ],
      ),
    );
  }


  Widget _buildMainImage() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.asset(widget.imageUrl, height: 518, width: double.infinity, fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildTopRow(BuildContext context) {
    return Positioned(
      top: 20, left: 20, right: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          backButton(width: 12, onTap: () => Navigator.pop(context)),
          Row(
            children: [
              filterButton(context),
              const SizedBox(width: 10),
              _buildFavoriteButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFavoriteButton() {
    return _buildCircleButton(Icons.favorite, () {}, appSecondaryColor, Colors.white);
  }

  Widget _buildBottomRow() {
    return Positioned(
      bottom: 20, left: 20, right: 20,
      child: Row(
        children: [
          _buildContainerWithRating(),
          const SizedBox(width: 5),
          _buildContainerWithText("Apartment", fontSize: 10),
        ],
      ),
    );
  }

  Widget _buildContainerWithRating() {
    return _buildContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(star_icon),
          const SizedBox(width: 5),
          Text(widget.rating, style: GoogleFonts.montserrat(color: appPrimaryColor, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildContainerWithText(String text, {double fontSize = 14}) {
    return _buildContainer(
      child: Center(child: Text(text, style: GoogleFonts.raleway(fontSize: fontSize, color: appPrimaryColor))),
    );
  }

  Widget _buildContainer({required Widget child}) {
    return Container(
      height: 47, width: 101,
      decoration: BoxDecoration(color: Colors.black.withOpacity(0.6), borderRadius: BorderRadius.circular(25)),
      child: child,
    );
  }

  Widget _buildCircleButton(IconData icon, Function onPressed, Color backgroundColor, Color iconColor) {
    return Container(
      height: 50, width: 50,
      decoration: BoxDecoration(color: backgroundColor, shape: BoxShape.circle, boxShadow: [
        BoxShadow(offset: Offset(0, 1), blurRadius: 1, spreadRadius: 1.4, color: Colors.green.shade300),
      ]),
      child: IconButton(onPressed: () => onPressed(), icon: Icon(icon, color: iconColor)),
    );
  }

  Widget _buildRightColumn() {
    return Positioned(
      bottom: 20, right: 20,
      child: Column(
        children: [
          _buildImageWithBorder(near_rest_1),
          const SizedBox(height: 10),
          _buildImageWithBorder(near_rest_2),
          const SizedBox(height: 10),
          _buildImageWithText(near_rest_4),
        ],
      ),
    );
  }

  Widget _buildImageWithBorder(String imageAsset) {
    return Container(
      height: 60, width: 60,
      decoration: BoxDecoration(border: Border.all(color: appPrimaryColor, width: 2.5), borderRadius: BorderRadius.circular(10)),
      child: Center(child: Image.asset(imageAsset)),
    );
  }

  Widget _buildImageWithText(String imageAsset) {
    return Container(
      height: 60, width: 60,
      decoration: BoxDecoration(border: Border.all(color: appPrimaryColor, width: 2.5), borderRadius: BorderRadius.circular(10)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(imageAsset, fit: BoxFit.cover),
          Text('+3', style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.bold, color: appPrimaryColor)),
        ],
      ),
    );
  }

  Widget _buildPropertyDetails() {
    return Positioned(
      top: 540, left: 16, right: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.buildingName, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text("Rating: ${widget.rating}"),
          const SizedBox(height: 10),
          Text("Price: ${widget.price} /month"),
        ],
      ),
    );
  }

  Widget _buildPropertyInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildPropertyTitleAndPrice(),
          const SizedBox(height: 10),
          buildLocationRow(),
          buildCustomRow(),
          const SizedBox(height: 14),
          const Divider(color: dividergraycolor, thickness: 1),
          const SizedBox(height: 14),
          _buildPropertyFeatures(),
          const SizedBox(height: 14),
          propertiesLocationDetail(),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                nearFeaturesContainer("2 Hospitals"),
                const SizedBox(width: 7),
                nearFeaturesContainer("4 Schools"),
                const SizedBox(width: 7),
                nearFeaturesContainer("2 Gas Stations"),
                const SizedBox(width: 7),
                nearFeaturesContainer("4 Railway"),
              ],
            ),
          ),
          const SizedBox(height: 20),
          mapContaine(),
          const SizedBox(height: 20),
          nearPropertiesLocationDetail(),
          buildGridView(
            ratings: ratings,
            buildings: building,
            prices: prices,
            imageUrl: imageUrl,
            favoriteStatus: favoriteStatus,
            onFavoriteToggle: toggleFavorite,
            containerInnerColor: containerinnercolor1.withOpacity(0.2),
            maxFontColor: maxfontcolor.withOpacity(0.7),
            appPrimaryColor: appPrimaryColor,
            appSecondaryColor: Colors.white,
            starColor: Colors.yellow,
            locationIcon: location_icon,
          ),
         ]
      ),
    );
  }

  Widget _buildPropertyFeatures() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          buildContainer(bed_icon, "2 Bedrooms"),
          const SizedBox(width: 10),
          buildContainer(bathroom_icon, "1 Bathroom"),
          const SizedBox(width: 10),
          buildContainer(water_icon, "Water"),
        ],
      ),
    );
  }

  Widget buildLocationRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.location_on, size: 12, color: Colors.grey),
            const SizedBox(width: 8),
            Text('Jakarta, Indonesia', style: GoogleFonts.raleway(fontSize: 12, color: Colors.grey)),
          ],
        ),
        Text('per month', style: GoogleFonts.raleway(fontSize: 12, color: Colors.grey)),
      ],
    );
  }

  Widget buildPropertyTitleAndPrice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            "Wings Tower",  // Replace with dynamic property name
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        Text(
          "AED 2200",  // Replace with dynamic price
          style: GoogleFonts.lato(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ],
    );
  }

  Widget buildRentBuyRow() {
    return Row(
      children: [
        buildRentBuyContainer('Rent', appSecondaryColor, appPrimaryColor),
        const SizedBox(width: 10),
        buildRentBuyContainer('Buy', dividergraycolor.withOpacity(0.6), fontcolor),
      ],
    );
  }

  Widget buildRentBuyContainer(String label, Color backgroundColor, Color textColor) {
    return Container(
      height: 47, width: 72,
      decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: Text(
          label,
          style: GoogleFonts.raleway(color: textColor, fontSize: 10, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget buildCustomRow() {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildRentBuyRow(),
          fullViewContainer(),
        ],
      ),
    );
  }

  Widget fullViewContainer() {
    return Container(
      height: 50, width: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
          color: containerinnercolor,),
      child: Center(
        child: Image.asset(full_view_icon)
      ),
    );
  }
}

Widget buildContainer(String iconPath, String label) {
  return Container(
    height: 50,
    width: 143,
    decoration: BoxDecoration(
      color: dividergraycolor.withOpacity(0.5),
      borderRadius: BorderRadius.circular(100),
    ),
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconPath),
          SizedBox(width: 6),
          Text(
            label,
            style: GoogleFonts.raleway(
              fontSize: 12,
              color: fontcolor,
            ),
          ),
        ],
      ),
    ),
  );
}
Widget propertiesLocationDetail() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Location & Public Facilities',
          style:
          GoogleFonts.raleway(fontSize: 18, fontWeight: FontWeight.bold)),
      const SizedBox(height: 16),
      Row(
        children: [
          CircleAvatar(
            backgroundColor: containerinnercolor,
            radius: 25,
            child: Image.asset(pin_icon),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
             "St. Cikoko Timur, Kec. Pancoran, Jakarta Selatan, Indonesia 12770",
              style: GoogleFonts.lato(
                  fontSize: 14, color: containerinnercolor1),
            ),
          ),
        ],
      ),
      SizedBox(height: 15),
      Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: containerinnercolor.withOpacity(0.5),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Image with left padding
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(propeties_location_icon),
            ),

            // RichText for "2.5 KM from your location"
            RichText(
              text:  TextSpan(
                style: TextStyle(

                  color: Colors.black, // Default color
                ),
                children: <TextSpan>[
                  // "2.5 KM" text in bold
                  TextSpan(
                    text: "2.5 KM ",
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // "from your location" text in normal style
                  TextSpan(
                    text: "from your location",
                    style: GoogleFonts.raleway(
                      fontSize: 12,

                    ),
                  ),
                ],
              ),
            ),

            // Drop-down icon with padding
            Padding(
              padding: const EdgeInsets.all( 8.0),
              child: Image.asset(drop_down_icon),
            ),
          ],
        ),
      )
    ],
  );
}

Widget nearFeaturesContainer(String label) {
  return Container(
    height: 47,
    width: 100,
    decoration: BoxDecoration(
      color: dividergraycolor.withOpacity(0.5),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text(
            label,
            style: GoogleFonts.raleway(
              fontSize: 12,
              color: fontcolor,
            ),
          ),
        ],
      ),
    ),
  );
}


// The mapContainer widget
Widget mapContaine() {
  return Container(
    height: 235,
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(15),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          Image.asset(
            map_image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          _buildMapOverlayText(appPrimaryColor, fontcolor),
        ],
      ),
    ),
  );
}

// Overlay text widget
Widget _buildMapOverlayText(Color appPrimaryColor, Color textColor) {
  return Positioned(
    bottom: 0,
    left: 0,
    right: 0,
    child: Container(
      height: 50,
      decoration: BoxDecoration(
        color: containerinnercolor,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(15),
        ),
      ),
      child: Center(
        child: Text(
          "View all on Map",
          style: GoogleFonts.raleway(
            fontSize: 16,
            color: textColor,
          ),
        ),
      ),
    ),
  );
}
Widget nearPropertiesLocationDetail() {
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text('Nearby From this Location',
      style:
      GoogleFonts.raleway(fontSize: 18, fontWeight: FontWeight.bold)),
  ]);
}


