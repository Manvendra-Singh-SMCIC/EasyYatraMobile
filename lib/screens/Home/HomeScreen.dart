import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_yatra/authentication/auth_cotroller.dart';
import 'package:easy_yatra/elements/search_input.dart';
import 'package:easy_yatra/global.dart';
import 'package:easy_yatra/screens/Bookings/MyBookings.dart';
import 'package:easy_yatra/screens/Home/kind_of_stay_screen.dart';
import 'package:easy_yatra/screens/Notifications/Notifications.dart';
import 'package:easy_yatra/screens/OTP/login_screen.dart';
import 'package:easy_yatra/screens/empty_screens/Wishlist_empty.dart';
import 'package:easy_yatra/side_bar_features/help_center.dart';
import 'package:easy_yatra/side_bar_features/my_rewards.dart';
import 'package:easy_yatra/side_bar_features/profile.dart';
import 'package:easy_yatra/styles.dart';
import 'package:easy_yatra/utils/constant.dart';
import 'package:easy_yatra/widgets.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({Key? key}) : super(key: key);

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  late ScrollController _controller;

  double _scrollControllerOffset = 0.0;
  bool positionAtInitialState = true;

  _scrollListener() {
    setState(() {
      _scrollControllerOffset = _controller.offset;

      if (_scrollControllerOffset != 0) {
        positionAtInitialState = false;
      } else {
        positionAtInitialState = true;
      }
    });
  }

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  List cityFilterWidget = [
    {'image': 'assets/res/city/mumbai.jpg', 'city': 'Mumbai'},
    {'image': 'assets/res/city/delhi.jpg', 'city': 'Delhi'},
    {'image': 'assets/res/city/goa.jpg', 'city': 'Goa'},
    {'image': 'assets/res/city/indore.jpg', 'city': 'Indore'},
    {'image': 'assets/res/city/pune.jpg', 'city': 'Pune'}
  ];

  List category = [
    {
      'img': 'assets/res/kinds_of_stay/cat3.png',
      'name': 'Hotels',
    },
    {
      'img': 'assets/res/kinds_of_stay/cat2.png',
      'name': 'Vilas',
    },
    {
      'img': 'assets/res/kinds_of_stay/cat1.png',
      'name': 'Apartments',
    },
    {
      'img': 'assets/res/kinds_of_stay/cat3.png',
      'name': 'Cabins',
    },
    {
      'img': 'assets/res/kinds_of_stay/cat1.png',
      'name': 'Vilas',
    }
  ];
  String dropDownStringValue = 'Lonavala';

  String a = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
        child: Scaffold(
          drawer: const MyDrawer(),
          body: NestedScrollView(
            controller: _controller,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  actions: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 3, 0),
                            child: Icon(
                              Icons.place_rounded,
                              color: activeBlueColor,
                              size: 18,
                            ),
                          ),
                          DropdownButton<String>(
                            isDense: true,
                            borderRadius: BorderRadius.circular(15),
                            elevation: 0,
                            value: dropDownStringValue,
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              color: activeBlueColor,
                            ),
                            items: <String>[
                              'Lonavala',
                              'Mumbai',
                              'Pune',
                              'Nashik'
                            ].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: activeBlueColor,
                              size: 25,
                            ),
                            onChanged: (value) {
                              setState(() {
                                dropDownStringValue = value!;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                  leading: IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.menu_rounded,
                        color: activeBlueColor,
                        size: 35,
                      ),
                    ),
                  ),
                  backgroundColor: Colors.transparent,
                  // expandedHeight: 30,
                  floating: true,
                  snap: false,
                )
              ];
            },
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: width(context) * 0.9,
                    child: Text(
                      "Find Deals on Hotels, Stays, Resorts and much more...",
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Container(width: width(context) * 0.9, child: SearchInput()),
                  ListTile(
                    leading: Text(
                      "Hotels near you !!",
                      style: bodytext18Ww600,
                    ),
                    trailing: Visibility(
                      visible: true,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text("View all"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height(context) * 0.42,
                    child: ListView.builder(
                        itemCount: 8,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (c, index) {
                          return itemCard(
                            context,
                            4433,
                            3500,
                            4.7,
                            'assets/res/hotel_img.jpg',
                            "Hotel Sunshine Inn",
                            'Near Prem Nagar',
                            'Loreium Ipsumsjdbvvv sd sbv fvbmfvmfsdfweneufmgo',
                          );
                        }),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
                        Text(
                          "Explore by City",
                          style: bodytext18Ww600,
                        ),
                        Visibility(
                          visible: false,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text("View all"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height(context) * 0.1,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: cityFilterWidget.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 58,
                                height: 58,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      cityFilterWidget[index]['image'],
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Text(
                                cityFilterWidget[index]['city'],
                                style: cityNameText,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 15, top: 10, right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Holiday Retreats",
                          style: bodytext18Ww600,
                        ),
                        Visibility(
                          visible: true,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text("View all"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height(context) * 0.43,
                    child: ListView.builder(
                        itemCount: 8,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (c, index) {
                          return itemCard(
                            context,
                            4433,
                            3500,
                            4.7,
                            'assets/res/hotel_img.jpg',
                            "Hotel Sunshine Inn",
                            'Near Prem Nagar',
                            'Loreium Ipsumsjdbvvv sd sbv fvbmfvmfsdfweneufmgo',
                          );
                        }),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 15, bottom: 10, right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Kind of stays you want",
                          style: bodytext18Ww600,
                        ),
                        Visibility(
                          visible: true,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text("View all"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(left: 10),
                      height: height(context) * 0.13,
                      child: ListView.builder(
                          itemCount: category.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (c, i) {
                            return Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const KindOfStayScreen()));
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 5,
                                      ),
                                      width: 135,
                                      height: 70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        image: DecorationImage(
                                          image: AssetImage(
                                            category[i]['img'],
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    category[i]['name'],
                                    textAlign: TextAlign.start,
                                    style: kindsOfStayTitleText,
                                  ),
                                ],
                              ),
                            );
                          })),
                  Container(
                    padding: const EdgeInsets.only(left: 15, right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Offers for you",
                          style: bodytext18Ww600,
                        ),
                        Visibility(
                          visible: true,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text("View all"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    height: height(context) * 0.15,
                    child: ListView.builder(
                        itemCount: 8,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return smallOfferCard(context);
                        }),
                  ),
                  quotesContainer(context,
                      '“A good traveler has no fixed plans, and is not intent on arriving.” – Lao Tzu'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
        ),
      ),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.person_rounded,
                  color: Colors.black,
                  size: 35,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Global.userMap["data"][0]["name"],
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      Global.userMap["data"][0]["email"],
                      style: greyText,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                      child: InkWell(
                        onTap: () {
                          nextScreen(context, Profile(edit: true));
                        },
                        child: Text(
                          "Edit",
                          style: clickableEditButton,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const Divider(
            height: 1,
            thickness: 1,
          ),
          ListTile(
            title: const Text('Wishlist'),
            leading: const Icon(
              Icons.favorite_outline_rounded,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const WishlistEmpty())));
            },
          ),
          const Divider(
            height: 1,
            thickness: 1,
          ),
          ListTile(
            title: const Text('My Bookings'),
            leading: const Icon(
              Icons.work_outline_rounded,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyBookings()));
            },
          ),
          const Divider(
            height: 1,
            thickness: 1,
          ),
          ListTile(
            title: const Text('My Rewards'),
            leading: const Icon(
              Icons.card_giftcard_rounded,
              color: Colors.black,
            ),
            onTap: () {
              nextScreen(context, const MyRewards());
            },
          ),
          const Divider(
            height: 1,
            thickness: 1,
          ),
          ListTile(
            title: const Text('Notifications'),
            leading: const Icon(
              Icons.notifications_none_rounded,
              color: Colors.black,
            ),
            onTap: () {
              nextScreen(context, NotificationPage(visible: true));
            },
          ),
          const Divider(
            height: 1,
            thickness: 1,
          ),
          ListTile(
            title: const Text('Customer Support'),
            leading: const Icon(
              Icons.support_agent_rounded,
              color: Colors.black,
            ),
            onTap: () {
              nextScreen(context, const HelpCenter());
            },
          ),
          const Divider(
            height: 1,
            thickness: 1,
          ),
          SizedBox(
            height: height(context) * 0.25,
          ),
          Container(
            margin: EdgeInsets.all(40),
            width: width(context) * 0.2,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(10)),
            child: InkWell(
              onTap: (){
                Global.destroy();
                replaceScreen(context, LoginScreen());
              },
              child: const Center(
                child: Text(
                  'Log out',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
