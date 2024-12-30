import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqatah/Data/Images_Data.dart';

import '../../Common/Nav_Button.dart';
import '../../Common/Title_Subtitle.dart';
import '../../Data/Colors_Data.dart';
import '../../common/back_button.dart';
import 'Otp_Screen.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _fullnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isFullNameValid = false;
  bool _isEmailValid = false;
  bool _isPasswordValid = false;

  @override
  void dispose() {
    _fullnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _validateField(String value, Function(bool) updateState,
      bool Function(String) condition) {
    setState(() {
      updateState(condition(value));
    });
  }

  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      backgroundColor: appPrimaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: width * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              backButton(
                  width: width,
                  onTap: () {
                    Navigator.pop(context);
                  }),
              SizedBox(height: height * 0.02),
              richTextSection(
                screenWidth: width * 0.05,
                screenHeight: height * 0.1,
                fontColor: Colors.grey.shade900,
                maxFontColor: Colors.black,
                mainText: "Create your",
                highlightedText: "account",
                description: "Sign up to access our services",
                mainFontSize: 25,
                highlightedFontSize: 28,
                topPadding: 10,
              ),
              _buildTextField(
                controller: _fullnameController,
                hintText: "Full Name",
                icon: profile_icon,
                onChanged: (value) => _validateField(
                    value,
                    (isValid) => _isFullNameValid = isValid,
                    (text) => text.length >= 4),
                isValid: _isFullNameValid,
              ),
              _buildTextField(
                controller: _emailController,
                hintText: "E-mail",
                icon: mail_icon,
                onChanged: (value) => _validateField(
                    value,
                    (isValid) => _isEmailValid = isValid,
                    (text) => text.contains('@gmail.com')),
                isValid: _isEmailValid,
              ),
              _buildTextField(
                controller: _passwordController,
                hintText: "Password",
                icon: lock_icon,
                onChanged: (value) => _validateField(
                    value,
                    (isValid) => _isPasswordValid = isValid,
                    (text) => text.length >= 8),
                isPassword: true,
                isValid: _isPasswordValid,
              ),
              TextButton(
                onPressed: () {},
                child: Text("Terms of service",
                    style: GoogleFonts.lato(
                        fontSize: 12, color: const Color(0xFF283E4A))),
              ),
              SizedBox(height: height * 0.03),
              navButton(
                buttonText: "Register",
                width: width * 0.7,
                height: height * 0.08,
                color: const Color(0xFF612C8C),
                onTap: () {
                  setState(() {
                    // Revalidate fields
                    _isFullNameValid = _fullnameController.text.length >= 4;
                    _isEmailValid =
                        _emailController.text.contains('@gmail.com');
                    _isPasswordValid = _passwordController.text.length >= 8;
                  });

                  if (_isFullNameValid && _isEmailValid && _isPasswordValid) {
                    // Navigate to OTP screen if all fields are valid
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const OtpPage()),
                    );
                  } else {
                    // Show Snackbar for invalid input
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Please fill in all fields correctly.',
                            style: GoogleFonts.lato(
                                color: Colors.white, fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        duration: const Duration(seconds: 3),
                      ),
                    );
                  }
                },
                textStyle: GoogleFonts.lato(
                  fontSize: 20,
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(15),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required String icon,
    required Function(String) onChanged,
    bool isPassword = false,
    bool isValid = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword && !_isPasswordVisible,
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          hintText: hintText,
          hintStyle: GoogleFonts.raleway(fontSize: 12, color: Colors.grey),
          prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Image.asset(icon, width: 20, height: 20)),
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey),
                  onPressed: () =>
                      setState(() => _isPasswordVisible = !_isPasswordVisible),
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: isValid ? Colors.green : Colors.red),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: isValid ? Colors.green : Colors.red),
          ),
        ),
      ),
    );
  }
}
