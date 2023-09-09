/**
 *import 'dart:async';
    import 'dart:developer';

    import 'package:flutter/material.dart';
    import 'package:flutter_svg/flutter_svg.dart';
    import 'package:hotel_booking_app/initial_screen.dart';
    import 'package:hotel_booking_app/screens/Home/HomeScreen.dart';
    import 'package:hotel_booking_app/styles.dart';
    import 'package:hotel_booking_app/utils/constant.dart';
    import 'package:location/location.dart';

    import '../../global.dart';
    // import 'package:gradient_app_bar/gradient_app_bar.dart';

    class LocationScreen extends StatefulWidget {
    const LocationScreen({super.key});

    @override
    State<LocationScreen> createState() => _LocationScreenState();
    }

    class _LocationScreenState extends State<LocationScreen> {
    check() async {
    bool serviceEnabled;
    serviceEnabled = await location.serviceEnabled();
    done = 1;
    Global.locationEnabled = serviceEnabled;
    if (!serviceEnabled) {
    if (!serviceEnabled) {
    return;
    }
    }
    }

    int done = 0;

    Location location = Location();
    @override
    Widget build(BuildContext context) {
    return Scaffold(
    body: FutureBuilder(
    future: check(),
    builder: (context, snapshot) {
    if (done == 1 && Global.locationEnabled == true) {
    if (mounted) {
    log("It is mounted");
    Timer(const Duration(seconds: 2), () {
    replaceScreen(context, InitialScreenPage());
    });
    }
    return Container();
    } else {
    return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Expanded(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    Center(
    child: Container(
    width: 100,
    height: 100,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(60),
    color: const Color.fromRGBO(232, 244, 255, 1),
    ),
    child: const Center(
    child: Icon(
    Icons.location_on,
    size: 80,
    color: darkBlue,
    ),
    ),
    ),
    ),
    Center(
    child: Column(
    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: const [
    Text(
    "Enable location",
    style:
    TextStyle(color: Colors.black, fontSize: 28),
    ),
    SizedBox(
    height: 10,
    ),
    Text(
    "You need to enable location to \nbrowse stays near you",
    textAlign: TextAlign.center,
    style: TextStyle(
    color: Color.fromRGBO(94, 94, 94, 100),
    fontSize: 18,
    ),
    ),
    ],
    ),
    ),
    ],
    ),
    ),
    TextButton(
    onPressed: () async {
    bool serviceEnabled = await location.requestService();
    Global.locationEnabled = serviceEnabled;
    if (Global.locationEnabled) {
    setState(() {});
    }
    PermissionStatus permissionGranted =
    await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
    log("No");
    permissionGranted = await location.requestPermission();
    if (permissionGranted != PermissionStatus.granted) {
    log("No NO");
    return;
    }
    }
    },
    // padding: const EdgeInsets.all(5.0),
    child: Container(
    width: MediaQuery.of(context).size.width * 0.6,
    decoration: BoxDecoration(
    gradient: blueGradient(),
    borderRadius: BorderRadius.all(Radius.circular(80.0))),
    padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
    child: const Text(
    'ALLOW LOCATION',
    style: TextStyle(fontSize: 14, color: Colors.white),
    textAlign: TextAlign.center,
    ),
    ),
    ),
    TextButton(
    onPressed: () {
    replaceScreen(context, InitialScreenPage());
    },
    child: const Text(
    "Skip this step",
    style: TextStyle(color: Color.fromRGBO(94, 94, 94, 1)),
    ),
    )
    ],
    );
    }
    },
    ),
    );
    }
    }
 */