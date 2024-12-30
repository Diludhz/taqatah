import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqatah/Common/Divider_Function.dart';
import 'package:taqatah/Common/Nav_Button.dart';
import 'package:taqatah/Common/Not_Account.dart';
import 'package:taqatah/Data/Images_Data.dart';
import '../../Common/Social_Containers.dart';
import '../../Common/Title_Subtitle.dart';
import '../../Data/Colors_Data.dart';
import '../Location_Status/Add_Location_Screen.dart';
import 'Utils/Forget_Function.dart';

class SignPage extends StatefulWidget {
  const SignPage({super.key});

  @override
  _SignPageState createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _showErrorMessage = false;

  // Validate email
  bool get _isEmailValid =>
      _emailController.text.isNotEmpty &&
      _emailController.text.endsWith('@gmail.com');

  // Validate password
  bool get _isPasswordValid => _passwordController.text.length >= 8;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: appPrimaryColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              sigin_image1,
              width: screenWidth,
              height: screenHeight * 0.25, // 25% of screen height
            ),
            SizedBox(height: screenHeight * 0.01),
            richTextSection(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              fontColor: fontcolor,
              maxFontColor: Colors.black, // Example color
              mainText: "Let’s",
              highlightedText: "Sign In",
              description: "quis nostrud exercitation ullamco laboris nisi ut",
            ),
            if (_showErrorMessage)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                child: Container(
                  height: screenHeight * 0.08, // 8% of screen height
                  width: screenWidth * 0.9, // 90% of screen width
                  decoration: const BoxDecoration(
                      color: maxfontcolor,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Center(
                    child: Text(
                      'Your password is incorrect',
                      style: GoogleFonts.lato(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: appPrimaryColor,
                      ),
                    ),
                  ),
                ),
              ),

            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.06,
                  vertical: screenHeight * 0.015),
              child: Container(
                height: screenHeight * 0.09,
                width: screenWidth * 0.9,
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F4F8),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: _isEmailValid ? Colors.green : Colors.black,
                  ),
                ),
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: GoogleFonts.raleway(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 20.0), // Center content
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Image.asset(
                        mail_icon,
                        width: 20,
                        height: 20,
                      ),
                    ),
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
            ),
            // Password TextFormField
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.06,
                  vertical: screenHeight * 0.015),
              child: Container(
                height: screenHeight * 0.09,
                width: screenWidth * 0.9,
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F4F8),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: _isPasswordValid ? Colors.green : Colors.black,
                  ),
                ),
                child: TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: GoogleFonts.raleway(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 20.0),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Image.asset(
                        lock_icon,
                        width: 20,
                        height: 20,
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                    border: InputBorder.none,
                  ),
                  obscureText: !_isPasswordVisible,
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
            ),
            forgotPasswordButton(() {}),
            Center(
              child: navButton(
                height: screenHeight * 0.08,
                width: screenWidth * 0.75,
                color: const Color(0xFF612C8C),
                buttonText: 'Login',
                textStyle: GoogleFonts.lato(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  if (_isEmailValid && _isPasswordValid) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddLocationPage()));
                  } else {
                    setState(() {
                      _showErrorMessage = true;
                    });
                  }
                },
              ),
            ),

            DividerLines(context),
            SocialButtons(context),
            SizedBox(height: screenHeight * 0.045),
            BottomRegisterText(context),
          ],
        ),
      ),
    );
  }
}
