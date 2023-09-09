import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_yatra/styles.dart';
import 'package:easy_yatra/utils/constant.dart';
import 'package:easy_yatra/widgets.dart';

class NotificationPage extends StatelessWidget {
  NotificationPage({super.key, required this.visible});

  final bool visible;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          elevation: 0.5,
          backgroundColor: white,
          leading: Visibility(
            visible: visible,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
              color: Colors.black,
            ),
          ),
          title: const Text(
            "Notifications",
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        body: Container(
          color: white,
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 150,
                        width: width(context) * 0.28,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            addVerticalSpace(20),
                            const Center(
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                    "https://picsum.photos/200/300"),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 150,
                        width: width(context) * 0.65,
                        padding:
                            EdgeInsets.only(top: 10, right: 10, bottom: 10),
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontSize: 13.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "12:30 PM",
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.bold,
                            color: black.withOpacity(0.6),
                            fontSize: 12,
                          ),
                        ),
                        addHorizontalySpace(15)
                      ],
                    ),
                  ),
                  addVerticalSpace(8),
                  Container(
                    height: 1,
                    width: width(context) * 0.93,
                    color: grey.withOpacity(0.5),
                  )
                ],
              );
            },
          ),
        ));
  }
}
