import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_yatra/styles.dart';
import 'package:easy_yatra/widgets.dart';

import '../../utils/constant.dart';

class WishlistFull extends StatefulWidget {
  const WishlistFull({super.key});

  @override
  State<WishlistFull> createState() => _WishlistFullState();
}

class _WishlistFullState extends State<WishlistFull> {
  late ScrollController _controller;
  double _scrollControllerOffset = 0.0;
  bool positionAtInitialState = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        child: Stack(children: [
          Container(
            height: 290,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/res/wishlist.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  expandedHeight: 150,
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.all(5),
                      ),
                      child: const Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  actionsIconTheme: const IconThemeData(
                    size: 20,
                  ),
                  flexibleSpace: Stack(
                    fit: StackFit.expand,
                    children: [],
                  ),
                ),
              ];
            },
            body: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "My Wishlist",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.more_vert),
                          ),
                        ],
                      ),
                      const Text(
                        "1 Item",
                        style: TextStyle(
                          color: Color.fromRGBO(94, 94, 94, 1),
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Last updated on 23 Aug`22",
                            style: TextStyle(
                                color: Color.fromRGBO(61, 153, 238, 1),
                                fontSize: 12),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Container(
                              alignment: Alignment.center,
                              height: MediaQuery.of(context).size.height * 0.04,
                              width: MediaQuery.of(context).size.height * 0.15,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: <Color>[
                                    Color.fromRGBO(61, 153, 238, 100),
                                    Color.fromRGBO(154, 207, 255, 100),
                                  ],
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: const Text(
                                "Share Wishlist",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.black,
                            size: 30,
                          ),
                          Text(
                            "Mumbai",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.95,
                        // height: height(context) * 0.38,
                        margin: const EdgeInsets.all(12),
                        child: Card(
                          elevation: 1.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                child: Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        //   Navigator.push(
                                        //       context,
                                        //       MaterialPageRoute(
                                        //           builder: (context) => HotelPreviewPage(
                                        //               bPrice: bPrice,
                                        //               aPrice: aPrice,
                                        //               rating: rating,
                                        //               imageAsset: imageAsset,
                                        //               name: name,
                                        //               area: area,
                                        //               description: description)));
                                      },
                                      child: Image.asset(
                                        'assets/res/booking2.png',
                                        fit: BoxFit.fill,
                                        // height: 191,
                                        width: width(context),
                                      ),
                                    ),
                                    Positioned(
                                      child: Container(
                                        // height: 20,
                                        width: 50,
                                        // padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                                        decoration: BoxDecoration(
                                          color: pink,
                                          borderRadius:
                                              BorderRadius.circular(5),
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
                                    ),
                                    Positioned(
                                      top: 1,
                                      right: -5,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          shape: const CircleBorder(),
                                          backgroundColor: Colors.white,
                                          // padding: const EdgeInsets.all(10),
                                        ),
                                        child: const Icon(
                                          Icons.favorite_border_rounded,
                                          color: pink,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                    top: 1, bottom: 1, left: 10, right: 10),
                                // height: height(context) * 0.13,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "Clarks Inn Suits",
                                          style: hotelName,
                                        ),
                                        Text(
                                          "New Prem Nagar",
                                          style: greyText,
                                        ),
                                        SizedBox(
                                          width: width(context) * 0.5,
                                          child: Text(
                                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit jhdjjdjnn,dd,nkljejkled,kdjdkeewjnkcnukew n 8efce9o9uoefihie ihh",
                                            style: greyText,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        RatingBar.builder(
                                          initialRating: 3,
                                          itemCount: 5,
                                          itemSize: 18,
                                          itemPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 1.0),
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Colors.amber[900],
                                          ),
                                          onRatingUpdate: (onRatingUpdate) {
                                            print(onRatingUpdate);
                                          },
                                        ),
                                        Text(
                                          '₹ 4,433',
                                          style: GoogleFonts.lato(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black38,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          '₹ 3,493',
                                          style: bodytext18Ww600,
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          "+ ₹ 594 taxes and fee",
                                          style: blackNormalText,
                                        ),
                                        Text(
                                          "Per Night",
                                          style: greyText,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
