import 'package:flutter/material.dart';
import 'package:taqatah/Data/Colors_Data.dart';
import 'package:taqatah/Data/Images_Data.dart';
import 'package:taqatah/Pages/Home/Home_Favorite_Screen.dart';
import 'package:taqatah/Pages/Home/Home_User_Profile.dart';
import 'package:taqatah/Pages/Menu/Home_Menu_Screen.dart';
import '../../Common/Row_With_Space.dart';
import '../Favorite/Search_items.dart';
import 'Utils/BottomSheet_Pop.dart';
import 'Utils/Clipper_Screen.dart';
import 'Utils/Custom_Gridview.dart';
import 'Utils/Header_Row.dart';
import 'Utils/Home_Custom_C1.dart';
import 'Utils/Home_Header.dart';
import 'Utils/Split_Custom_Container.dart';
import 'Utils/Tabs_Selector_Screen.dart';
import 'Utils/Textfield_Box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.locationText});
  final String locationText;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);

  final List<Widget> _pages = [
    const MainContentScreen(),
    const HomeMenuScreen(),
    const FavoritePage(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<int>(
        valueListenable: selectedIndexNotifier,
        builder: (context, updatedIndex, _) {
          return _pages[updatedIndex]; // Show the selected page
        },
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: selectedIndexNotifier,
        builder: (context, updatedIndex, _) {
          return BottomNavigationBar(
            backgroundColor: Colors.grey.shade100,
            type: BottomNavigationBarType.fixed,
            currentIndex: updatedIndex,
            selectedItemColor: appSecondaryColor,
            unselectedItemColor: Colors.black,
            iconSize: 20, // Smaller icon size
            showSelectedLabels: false, // Hide selected labels
            showUnselectedLabels: false, // Hide unselected labels
            onTap: (newIndex) {
              selectedIndexNotifier.value = newIndex; // Update selected index
            },
            items: [
              BottomNavigationBarItem(
                icon: bottomAssetIcon(bottom_nav_home, updatedIndex == 0),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: bottomAssetIcon(bottom_nav_menu, updatedIndex == 1),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: bottomAssetIcon(bottom_nav_favorite, updatedIndex == 2),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: bottomAssetIcon(bottom_nav_user, updatedIndex == 3),
                label: '',
              ),
            ],
          );
        },
      ),
    );
  }

  Widget bottomAssetIcon(String assetPath, bool isSelected) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisSize: MainAxisSize.min, // Reduce overall size
      children: [
        Image.asset(
          assetPath,
          width: screenWidth * 0.08, // Smaller width
          height: screenHeight * 0.025, // Smaller height
          color: isSelected ? appSecondaryColor : Colors.black,
        ),
        if (isSelected) SizedBox(height: 4),
        if (isSelected)
          Container(
            width: 20, // Smaller indicator width
            height: 2, // Smaller indicator height
            color: appSecondaryColor,
          ),
      ],
    );
  }
}

class MainContentScreen extends StatefulWidget {
  const MainContentScreen({super.key});

  @override
  State<MainContentScreen> createState() => _MainContentScreenState();
}

class _MainContentScreenState extends State<MainContentScreen> {
  bool _showGridView = false; // Moved outside the build method
  final List<bool> favoriteStatus = List.generate(20, (index) => false);

  void toggleGridView() {
    setState(() {
      _showGridView = !_showGridView; // Toggle the visibility flag
    });
  }

  void toggleFavorite(int index) {
    setState(() {
      favoriteStatus[index] = !favoriteStatus[index];
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 5), () {
        showLocationBottomSheet(context);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        children: [
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              height: screenHeight * 0.23,
              decoration: const BoxDecoration(color: hometopcontainercolor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  headerRow(
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                    locationIconPath: location_icon,
                    dropDownIconPath: drop_down_icon,
                    notificationIconPath: notification_icon,
                    userProfilePath: user_profile,
                    appPrimaryColor: appPrimaryColor,
                    appSecondaryColor: Colors.white,
                    containerInnerColor: Colors.grey,
                    locationText: "Jakarta, Indonesia",
                    context: context,
                  ),
                  headerText(
                    text1: "Hey",
                    text2: "Jonathan!",
                    text1Color: const Color(0xFF252B5C),
                    text2Color: const Color(0xFF283E4A),
                  ),
                  headerText(
                    text1: "Let's start exploring",
                    text2: "",
                    text1Color: const Color(0xFF252B5C),
                    text2Color: const Color(0xFF252B5C),
                  ),
                ],
              ),
            ),
          ),
          buildSearchBox(
            screenHeight: MediaQuery.of(context).size.height,
            searchIconPath: textfield_serach_icon,
            hintText: "Search House, Apartment, etc",
            boxColor: const Color(0xFFF5F5F5),
            borderColor: const Color(0xFFE0E0E0),
            hintTextColor: const Color(0xFFB0B0B0),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchItemsScreen(),
                ),
              );
            },
          ),
          const TabsSelection(),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CustomContainer(
                  imageUrl: custom_C1,
                  text1: 'Halloween',
                  text2: 'Sale!',
                  subtitle: 'All discount up to 60%',
                ),
                CustomContainer(
                  imageUrl: custom_C2,
                  text1: 'Summer',
                  text2: 'Vacation',
                  subtitle: 'All discount up to 60%',
                ),
                CustomContainer(
                  imageUrl: custom_C1,
                  text1: 'Halloween',
                  text2: 'Sale!',
                  subtitle: 'All discount up to 60%',
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const SplitContainerPageView(),
          Column(
            children: [
              RowWithTextButton(
                leftText: "Explore Nearby Estates",
                rightButtonText:
                    _showGridView ? "View Less" : "View All", // Toggle text
                onRightButtonPressed: () {
                  setState(() {
                    _showGridView =
                        !_showGridView; // Toggle the visibility flag
                  });
                },
              ),
              if (_showGridView)
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: buildGridView(
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
                ),
            ],
          ),
          if (_showGridView) const SplitContainerPageView()
        ],
      ),
    );
  }
}
