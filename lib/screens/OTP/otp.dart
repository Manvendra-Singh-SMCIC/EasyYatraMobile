import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:pinput/pin_put/pin_put.dart';
import '../../authentication/otp_controller.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import '../../styles.dart';
import '../../utils/constant.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});
  static String verify = "";

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  bool isChanged = false;
  String otp = "";

  final TextEditingController pinEditingController = TextEditingController();
  final FocusNode pinFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        body: Container(
          color: const Color.fromRGBO(255, 255, 255, 100),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 30.0,
                    ),
                    const Text(
                      "Confirm your number",
                      style: TextStyle(fontSize: 30),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      'Enter the 4-digit OTP',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    PinCodeTextField(
                      pinBoxBorderWidth: 0,
                      controller: pinEditingController,
                      focusNode: pinFocusNode,
                      pinBoxHeight: 40,
                      pinBoxWidth: 40,
                      pinBoxRadius: 0,
                      pinTextStyle: TextStyle(fontSize: 16),
                      maxLength: 6,
                      autofocus: true,
                      highlightAnimation: true,
                      highlightAnimationBeginColor: Colors.black,
                      highlightAnimationEndColor: Colors.black,
                      keyboardType: TextInputType.number,
                      onDone: (pin) {
                        otp = pin;
                        print("Pin code entered: $pin");
                      },
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Resend code',
                  style: TextStyle(
                    color: Color.fromRGBO(242, 143, 59, 100),
                  ),
                ),
              ),
              Container(
                // height: 5,
                width: MediaQuery.of(context).size.width,

                decoration: BoxDecoration(
                  gradient: isChanged
                      ? blueGradient()
                      : const LinearGradient(
                          colors: [
                            Color.fromRGBO(94, 94, 94, 1),
                            Color.fromRGBO(94, 94, 94, 1)
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                ),
                child: MaterialButton(
                  height: 45,
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  onPressed: () {
                    try {
                      print(otp);
                      OtpController.instace.verifyOTP(otp.toString());
                    } catch (e) {
                      snackbar(
                        "Wrong OTP",
                        "Try Again",
                      );
                    }
                  },
                  child: const Text(
                    "Continue",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
