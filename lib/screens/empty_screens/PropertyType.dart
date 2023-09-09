import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/material.dart';
import 'package:easy_yatra/utils/constant.dart';
import 'package:easy_yatra/widgets.dart';

class PropertyType extends StatefulWidget {
  const PropertyType({super.key});

  @override
  State<PropertyType> createState() => _PropertyTypeState();
}

class _PropertyTypeState extends State<PropertyType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          titleSpacing: 1,
          leadingWidth: 1,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Select Room",
                style: TextStyle(fontSize: 24, color: Colors.black),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Sep 8 - Sep 9",
                    style: TextStyle(
                        color: Color.fromRGBO(61, 153, 238, 1), fontSize: 12),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  blueListedDots(),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    "1 room",
                    style: TextStyle(
                        color: Color.fromRGBO(61, 153, 238, 1), fontSize: 12),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  blueListedDots(),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    "2 Guests",
                    style: TextStyle(
                        color: Color.fromRGBO(61, 153, 238, 1), fontSize: 12),
                  )
                ],
              ),
            ],
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          elevation: 0,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Club Room",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  const Image(
                    image: AssetImage("assets/res/club_room.png"),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          listedDots(),
                          const Text(
                            " 220 sq.ft",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          listedDots(),
                          const Text(
                            " City Viewt",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          listedDots(),
                          const Text(
                            " Twin Bed",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: layoutContainer(context),
            ),
            const Divider(
              thickness: 1,
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Executive Room",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  const Image(
                    image: AssetImage("assets/res/club_room.png"),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          listedDots(),
                          const Text(
                            " 220 sq.ft",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          listedDots(),
                          const Text(
                            " City Viewt",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          listedDots(),
                          const Text(
                            " Twin Bed",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: layoutContainer(context),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: layoutContainer(context),
            ),
          ],
        ),
      ),
      bottomNavigationBar: customNavigationBar(context),
    );
  }
}
