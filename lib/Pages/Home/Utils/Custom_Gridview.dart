import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildGridView({
  required List<String> ratings,
  required List<String> buildings,
  required List<String> prices,
  required List<String> imageUrl,
  required List<bool> favoriteStatus,
  required Function(int) onFavoriteToggle,
  required Color containerInnerColor,
  required Color maxFontColor,
  required Color appPrimaryColor,
  required Color appSecondaryColor,
  required Color starColor,
  required String locationIcon,
}) {
  return GridView.builder(
    physics: const NeverScrollableScrollPhysics(), // Disable GridView scrolling
    shrinkWrap: true, // Make GridView fit its content
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2, // Number of columns
      crossAxisSpacing: 16, // Space between columns
      mainAxisSpacing: 16, // Space between rows
      childAspectRatio: 160 / 271, // Aspect ratio for each item
    ),
    itemCount: ratings.length, // Number of items in the grid
    itemBuilder: (context, index) {
      final buildingName = buildings[index % buildings.length];
      final rating = ratings[index % ratings.length];
      final price = prices[index % prices.length];
      const location = "Jakarta, Indonesia";

      return Container(
        height: 253,
        width: 160,
        decoration: BoxDecoration(
          color: containerInnerColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                // Image
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage(imageUrl[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Bottom Right Container for Price
                Positioned(
                  bottom: 12,
                  right: 12,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 25,
                      width: 74,
                      decoration: BoxDecoration(
                        color: maxFontColor.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "\$$price",
                                style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: appPrimaryColor,
                                ),
                              ),
                              TextSpan(
                                text: " /month",
                                style: GoogleFonts.montserrat(
                                  fontSize: 6,
                                  color: appPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Favorite Button
                Positioned(
                  top: 17,
                  right: 17,
                  child: GestureDetector(
                    onTap: () => onFavoriteToggle(index),
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: favoriteStatus[index]
                              ? Colors.grey
                              : Colors.purple),
                      child: const Icon(
                        Icons.favorite,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Building Name
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    buildingName,
                    style: GoogleFonts.raleway(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: maxFontColor,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.star, color: starColor, size: 16),
                      Text(
                        rating,
                        style: GoogleFonts.raleway(
                          fontSize: 12,
                          color: containerInnerColor,
                        ),
                      ),
                      Image.asset(locationIcon),
                      Text(
                        location,
                        style: GoogleFonts.raleway(
                          fontSize: 12,
                          color: Colors.grey,
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
