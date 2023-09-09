import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:easy_yatra/screens/OTP/sign_up_screen.dart';
import 'package:easy_yatra/utils/constant.dart';

import '../../global.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  _navigate() async {
    await Future.delayed(Duration(seconds: 2), () {});
    if (mounted) {
      replaceScreen(context, SignUpScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    log("login" + Global.locationEnabled.toString());
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(61, 153, 238, 100),
        child: const Center(
          child: Text(
            "Hotel",
            style: TextStyle(
                color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
