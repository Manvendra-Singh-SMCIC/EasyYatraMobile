import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:easy_yatra/screens/empty_screens/Splash_screen.dart';
import 'package:easy_yatra/screens/empty_screens/splash_screen_for_registered.dart';
import 'package:easy_yatra/utils/constant.dart';

import 'authentication/auth_cotroller.dart';
import 'global.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  //await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  Global();
  Global.loggedin =
      await Global.fetch(Constants.LOGGEDIN.toString() + Global.saveKey);
  log("LOGGED IN: ${Global.loggedin}");
  runApp(MyApp());

  print("Hiiiiiiiiiiiiiiiiiiii");
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Yoooooooooooo");
    return GetMaterialApp(
      title: 'Easy Yatra',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: Global.loggedin == "yes"
          ? SplashScreenForRegisteredUser()
          : SplashScreen(),
      // home: initialScreenPage(),
    );
  }
}

class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(context),
      height: height(context),
      color: green,
    );
  }
}

