import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:easy_yatra/styles.dart';
import 'package:easy_yatra/utils/constant.dart';

import '../../elements/SearchScreenResult.dart';
import '../../widgets.dart';

class KindOfStayScreen extends StatelessWidget {
  const KindOfStayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(154, 207, 255, 1.0),
                  Color.fromRGBO(61, 153, 238, 1.0),
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 60, 25, 0),
                child: SizedBox(
                  height: 45,
                  child: TextField(
                    onSubmitted: (value) {
                      String query = value;
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SearchScreenResult(
                          searchQuery: query,
                        ),
                      ));
                    },
                    cursorColor: activeBlueColor,
                    style: searchBarHint,
                    decoration: InputDecoration(
                        fillColor: searchBarColor,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        hintText: 'Search hotel, location etc.',
                        hintStyle: searchBarHint,
                        suffixIcon: const Icon(
                          Icons.search,
                          color: activeBlueColor,
                          size: 25,
                        ),
                        contentPadding:
                            const EdgeInsets.only(top: 5, left: 15)),
                  ),
                ),
              ),
            ),
          )),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 7),
              child: Text(
                'Last minute Hotels near you',
                style: bodytext18Ww600,
              ),
            ),
            SizedBox(
              height: height(context) * 0.22,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return HotelNearYouWidget();
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 7),
              child: Text(
                'Trending Hotel Desitination',
                style: bodytext18Ww600,
              ),
            ),
            SizedBox(
              height: height(context) * 0.39,
              // width: width(context),
              child: ListView.builder(
                  itemCount: 8,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(top: 8),
                      height: height(context) * 0.36,
                      width: width(context) * 0.5,
                      child: Column(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset('assets/res/kindof2.png')),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text('Delhi',
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.w500)),
                          const Text(
                              'More than 143+ Booked hotels us with in Delhi',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: darkBlue))
                        ],
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 7),
              child: Text(
                'Top Hotels',
                style: bodytext18Ww600,
              ),
            ),
            SizedBox(
              height: height(context) * 0.38,
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
          ],
        ),
      ),
    );
  }
}

class HotelNearYouWidget extends StatelessWidget {
  const HotelNearYouWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: height(context) * 0.2,
      width: width(context) * 0.7,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [const BoxShadow(blurRadius: 1, color: Colors.grey)]),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
              child: Image.asset('assets/res/kindof1.png')),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sunset Inn',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                ),
                const Text(
                  'Delhi',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
                Container(
                  height: 20, width: 50,
                  // padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                  decoration: BoxDecoration(
                    color: pink,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Center(
                    child: Text(
                      "4.5",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 36.0, left: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        'Starting from',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: darkBlue),
                      ),
                      Text(
                        '₹ 3,493',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Per night',
                        style: TextStyle(
                          fontSize: 11,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
