import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:easy_yatra/utils/constant.dart';
import 'package:easy_yatra/widgets.dart';

class MyBookings extends StatefulWidget {
  const MyBookings({super.key});

  @override
  State<MyBookings> createState() => _MyBookingsState();
}

class _MyBookingsState extends State<MyBookings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        // leading: Container(
        //   margin: EdgeInsets.only(right: 20.0, left: 10),
        //   child: SizedBox(
        //     width: 40,
        //     height: 40,
        //     child: ElevatedButton(
        //       onPressed: () {
        //         Navigator.pop(context);
        //       },
        //       style: ElevatedButton.styleFrom(
        //         elevation: 5.0,
        //         backgroundColor: white, // Adjust the elevation value as needed
        //         shape: CircleBorder(),
        //       ),
        //       child: const Icon(
        //         Icons.arrow_back,
        //         size: 20.0, // Adjust the icon size as needed
        //         color: Colors.black,
        //       ),
        //     ),
        //   ),
        // ),

        title: const Text(
          "My Bookings",
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: const Color.fromRGBO(255, 255, 255, 1),
        child: Stack(
          children: [
            myBookingsCard(context),
          ],
        ),
      ),
    );
  }
}
