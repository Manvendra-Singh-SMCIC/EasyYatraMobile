import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_yatra/screens/Bookings/MyBookings.dart';
import 'package:easy_yatra/utils/constant.dart';
import 'package:easy_yatra/widgets.dart';

import '../../styles.dart';

class BookHistory extends StatefulWidget {
  const BookHistory({super.key});

  @override
  State<BookHistory> createState() => _BookHistoryState();
}

class _BookHistoryState extends State<BookHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        leading: Visibility(
          visible: false,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        title: const Text(
          "Booking History",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: Future<Object>(()=> ""),
        builder: (context, snapshot) {
          if (false) {
            return LoadingState(
                "Loading your data", kBodyText12wNormal(Colors.blue));
          } else {
            return SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // height: height(context),
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 12.0, top: 10),
                          child: Text(
                            "12 August 2022",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyBookings(),
                              ),
                            );
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.95,
                            // height: height(context) * 0.37,
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
                                            height: 191,
                                            width: width(context),
                                          ),
                                        ),
                                        Positioned(
                                          child: Container(
                                            height: 20, width: 50,
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
                                    padding: const EdgeInsets.all(5),
                                    // height: height(context) * 0.12,
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
                                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                                                style: greyText,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
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
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
