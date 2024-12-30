import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqatah/Data/Images_Data.dart';
import '../../Common/Row_With_Space.dart';
import '../../common/back_button.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final height = size.height;
    final width = size.width;

    // List of image paths for the left and right containers
    final List<String> leftImages = [
      notification_img_1,
      notification_img_2,
      notification_img_3
    ];

    final List<String> rightImages = [
      notification_img_1_1,
      notification_img_2_2,
      notification_img_1_1
    ];

    // List of heading, title, and subtitle for each notification
    final List<Map<String, String>> notificationData = [
      {
        "heading": "Emmett Perry",
        "title": "Just messaged you. Check the message in the message tab.",
        "subtitle": "10 mins ago",
      },
      {
        "heading": "Geraldo",
        "title": "Just giving 5 Star review on your listing Fairview Apartment",
        "subtitle": "40 mins ago",
      },
      {
        "heading": "Walter Lindsey",
        "title": "Just buy your listing Schoolview House",
        "subtitle": "4 hours ago",
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: backButton(
                    width: width,
                    onTap: () {
                      Navigator.pop(context);
                    }),
              ),
              _buildTrashButton(),
            ],
          ),
          const RowWithTextButton(
            leftText: "Notifications",
          ),
          const SizedBox(height: 15),
          // Dynamically create containers using the notification data
          for (int i = 0; i < notificationData.length; i++) ...[
            _buildCustomContainer(
              leftImages[i],
              rightImages[i],
              notificationData[i]["heading"]!,
              notificationData[i]["title"]!,
              notificationData[i]["subtitle"]!,
            ),
          ],
        ],
      ),
    );
  }
}

Widget _buildCustomContainer(String leftImagePath, String rightImagePath,
    String heading, String title, String subtitle) {
  return Padding(
    padding: const EdgeInsets.only(left: 24, right: 24, bottom: 10),
    child: Container(
      height: 108,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left-side circular container with image
          _buildCircularImageContainer(leftImagePath),
          // Center column with texts
          Expanded(
            flex: 3, // Adjust flex value to make room for the right image
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    heading,
                    style: GoogleFonts.raleway(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    title,
                    style: GoogleFonts.raleway(
                      fontSize: 10,
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    subtitle,
                    style: GoogleFonts.raleway(
                      fontSize: 8,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Right-side rectangular container with image
          _buildRectangularImageContainer(rightImagePath),
        ],
      ),
    ),
  );
}

Widget _buildCircularImageContainer(String imagePath) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: CircleAvatar(
      radius: 25,
      backgroundColor: Colors.white,
      child: ClipOval(
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          width: 50,
          height: 50,
        ),
      ),
    ),
  );
}

Widget _buildRectangularImageContainer(String imagePath) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 50,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

Widget _buildTrashButton() {
  return Padding(
    padding: const EdgeInsets.all(24.0),
    child: Align(
      alignment: Alignment.topLeft,
      child: CircleAvatar(
        backgroundColor: const Color(0xFFF5F4F8),
        radius: 25,
        child: Center(
          child: Image.asset(
            "assets/icons/ic_trash.png",
            fit: BoxFit.contain, // Ensures the image fits within the container
            width: 24, // Adjust width to fit well within the circle
            height: 24, // Adjust height to fit well within the circle
          ),
        ),
      ),
    ),
  );
}
