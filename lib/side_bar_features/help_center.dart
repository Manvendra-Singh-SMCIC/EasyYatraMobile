import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_yatra/styles.dart';
import 'package:easy_yatra/utils/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({super.key});

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 60,
        elevation: 0.5,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        title: const Text(
          "Help Center",
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(left: 14),
                  width: width(context) * 0.5,
                  height: height(context) * 0.2,
                  child: Center(
                    child: Text(
                      "We are here to help you out.",
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: width(context) * 0.5,
                  height: height(context) * 0.2,
                  child: Image.asset('assets/res/help_center.png'),
                ),
              ],
            ),
            addVerticalSpace(25),
            Container(
              height: height(context) * 0.45,
              width: width(context) * 0.86,
              padding: const EdgeInsets.only(left: 15, top: 17),
              decoration: BoxDecoration(
                color: grey.withOpacity(0.25),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Facing any Issue with Easyyatra?",
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 17,
                        ),
                      ),
                      addVerticalSpace(4),
                      Text(
                        "Email us your queries or problem.",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  addVerticalSpace(15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width(context) * 0.78,
                        height: 50,
                        child: TextField(
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            hintText: "Your Name",
                            hintStyle: GoogleFonts.lato(
                              fontWeight: FontWeight.normal,
                              color: grey.withOpacity(0.6),
                              fontSize: 16,
                            ),
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: white,
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                      addVerticalSpace(15),
                      SizedBox(
                        width: width(context) * 0.78,
                        height: 50,
                        child: TextField(
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            hintText: "Email",
                            hintStyle: GoogleFonts.lato(
                              fontWeight: FontWeight.normal,
                              color: grey.withOpacity(0.6),
                              fontSize: 16,
                            ),
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: white,
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                      addVerticalSpace(15),
                      SizedBox(
                        width: width(context) * 0.78,
                        height: 50,
                        child: TextField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(120),
                            WordLimitTextInputFormatter(120),
                          ],
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            hintText: "Issue(within 120 words)",
                            hintStyle: GoogleFonts.lato(
                              fontWeight: FontWeight.normal,
                              color: grey.withOpacity(0.6),
                              fontSize: 16,
                            ),
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: white,
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                      addVerticalSpace(25),
                    ],
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: width(context) * 0.78,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.blue,
                      ),
                      child: Center(
                        child: Text(
                          "Submit",
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.bold,
                            color: white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            addVerticalSpace(20),
            Center(
              child: Text(
                "or",
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ),
            addVerticalSpace(20),
            Container(
              width: width(context) * 0.86,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: grey.withOpacity(0.25),
              ),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    _launchPhone('8577098983');
                  },
                  child: Container(
                    width: width(context) * 0.78,
                    height: 40,
                    decoration: BoxDecoration(
                        color: white, borderRadius: BorderRadius.circular(25)),
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.call_outlined),
                          Text(
                            "Submit",
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.normal,
                              color: black,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _launchPhone(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      Get.snackbar(
        "Error",
        "Call Could not be sent",
        backgroundColor: Colors.red.withOpacity(0.65),
      );
    }
  }
}

class WordLimitTextInputFormatter extends TextInputFormatter {
  final int maxWords;

  WordLimitTextInputFormatter(this.maxWords);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final wordCount = _getWordCount(newValue.text);
    if (wordCount > maxWords) {
      // If the word count exceeds the maximum limit, prevent further input
      return oldValue;
    }
    return newValue;
  }

  int _getWordCount(String text) {
    // Split the text by spaces and count the words
    final words = text.trim().split(RegExp(r'\s+'));
    return words.length;
  }
}
