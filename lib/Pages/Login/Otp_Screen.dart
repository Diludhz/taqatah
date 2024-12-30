import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqatah/Data/Images_Data.dart';
import 'dart:async';

import 'package:taqatah/common/back_button.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final List<TextEditingController> _controllers =
      List.generate(4, (_) => TextEditingController());
  int _timerValue = 30;
  late final Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timerValue > 0) {
        setState(() => _timerValue--);
      } else {
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 30),
                child: backButton(
                    width: width,
                    onTap: () {
                      Navigator.pop(context);
                    }),
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.06),
                child: RichText(
                  text: TextSpan(
                    style: GoogleFonts.lato(
                        fontSize: width * 0.065,
                        color: const Color(0xFF252B5C)),
                    children: [
                      const TextSpan(text: "Enter the"),
                      const TextSpan(text: "  "),
                      TextSpan(
                          text: "code",
                          style: GoogleFonts.lato(
                              fontSize: width * 0.07,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF283E4A))),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.06,
                  vertical: width * 0.02,
                ),
                child: Text(
                  "Enter the 4-digit code we sent to\njonathan@email.com",
                  style: GoogleFonts.lato(
                      fontSize: width * 0.03, color: const Color(0xFF252B5C)),
                ),
              ),
              SizedBox(height: height * 0.04),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(4, (index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: width * 0.02),
                      height: height * 0.09,
                      width: width * 0.18,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F4F8),
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(width * 0.025),
                      ),
                      child: TextFormField(
                        controller: _controllers[index],
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                            counterText: "", border: InputBorder.none),
                        style: GoogleFonts.lato(fontSize: width * 0.07),
                        onChanged: (value) {
                          if (value.length == 1 && index < 3) {
                            FocusScope.of(context).nextFocus();
                          } else if (value.isEmpty && index > 0) {
                            FocusScope.of(context).previousFocus();
                          }
                        },
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: height * 0.3),
              Center(
                child: Container(
                  height: height * 0.07,
                  width: width * 0.25,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F4F8),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        clock_icon,
                        height: width * 0.06,
                        width: width * 0.06,
                      ),
                      Text('00:${_timerValue.toString().padLeft(2, '0')}',
                          style: GoogleFonts.lato(
                              fontSize: width * 0.05, color: Colors.black)),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              Center(
                child: RichText(
                  text: TextSpan(
                    style: GoogleFonts.lato(
                        fontSize: width * 0.04, color: const Color(0xFF252B5C)),
                    children: [
                      const TextSpan(text: "Didn’t receive the OTP?  "),
                      TextSpan(
                        text: "Resend OTP",
                        style: GoogleFonts.lato(
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF283E4A)),
                        recognizer: TapGestureRecognizer()..onTap = () {},
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
