import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqatah/Data/Images_Data.dart';
import 'package:taqatah/common/back_button.dart'; // Ensure this import exists and contains `user_profile_edit`.

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isNotificationEnabled = true; // State variable for notification toggle

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: backButton(
              width: 10,
              onTap: () {
                Navigator.pop(context);
              }),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Text(
                "Profile",
                style: GoogleFonts.lato(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            const SizedBox(height: 20),
            const Stack(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(user_profile_edit),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 150, 163, 203),
                    radius: 18,
                    child: Icon(Icons.edit, color: Colors.white, size: 18),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'Mathew Adam',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              'mathew@email.com',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 30),

            // Profile options with dividers
            buildOptionTile(
              assets: location_icon,
              label: 'Address',
              onTap: () {},
            ),
            buildDivider(),
            buildOptionTile(
              assets: history_icon,
              label: 'History',
              onTap: () {},
            ),
            buildDivider(),
            buildSwitchTile(
              assets: notification_icon,
              label: 'Notification',
              value: isNotificationEnabled,
              onChanged: (value) {
                setState(() {
                  isNotificationEnabled = value;
                });
                print('Notifications are ${value ? "Enabled" : "Disabled"}');
              },
            ),
            buildDivider(),
            buildOptionTile(
              assets: star_icon,
              label: 'Rate Us',
              onTap: () {},
            ),
            buildDivider(),
            buildOptionTile(
              assets: support_icon,
              label: 'Support',
              onTap: () {},
            ),
            buildDivider(),
            buildOptionTile(
              assets: language_icon,
              label: 'App Language',
              onTap: () {},
            ),
            buildDivider(),
            buildOptionTile(
              assets: change_lock_icon,
              label: 'Change Password',
              onTap: () {},
            ),
            buildDivider(),
            buildOptionTile(
              assets: about_icon,
              label: 'About App',
              onTap: () {},
            ),
            buildDivider(),
            buildOptionTile(
              assets: logo_out_icon,
              label: 'Log Out',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  // Helper methods
  Widget buildOptionTile({
    required String assets,
    required String label,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Image.asset(assets, color: Colors.purple),
      title: Text(
        label,
        style: GoogleFonts.lato(
            fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
      ),
      trailing:
          const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.black),
      onTap: onTap,
    );
  }

  Widget buildSwitchTile({
    required String assets,
    required String label,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return ListTile(
      leading: Image.asset(assets, color: Colors.purple),
      title: Text(
        label,
        style: GoogleFonts.lato(
            fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: Colors.white,
        inactiveThumbColor: Colors.white,
        inactiveTrackColor: Colors.grey.shade300,
        activeTrackColor: Colors.green,
      ),
    );
  }

  Widget buildDivider() {
    return Divider(
      thickness: 1,
      height: 0,
      indent: 20,
      endIndent: 20,
      color: Colors.grey[300],
    );
  }
}
