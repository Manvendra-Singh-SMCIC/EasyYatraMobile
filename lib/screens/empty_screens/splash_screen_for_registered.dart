import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:easy_yatra/apis/api_caller.dart';
import 'package:easy_yatra/initial_screen.dart';
import 'package:easy_yatra/utils/constant.dart';

import '../../global.dart';
import '../../global.dart';

class SplashScreenForRegisteredUser extends StatefulWidget {
  const SplashScreenForRegisteredUser({super.key});

  @override
  State<SplashScreenForRegisteredUser> createState() =>
      _SplashScreenForRegisteredUserState();
}

class _SplashScreenForRegisteredUserState
    extends State<SplashScreenForRegisteredUser> {
  @override
  void initState() {
    super.initState();
    _navigate();
    fetchUserData();
  }

  void fetchUserData() async{
    String email = await Global.fetch(Constants.EMAIL.toString()+Global.saveKey);
    Global.userMap = await getUsersByEmail(email);
    log(Global.userMap.toString());
  }

  _navigate() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    if (mounted) {
      replaceScreen(context, const InitialScreenPage());
    }
  }

  @override
  Widget build(BuildContext context) {
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
