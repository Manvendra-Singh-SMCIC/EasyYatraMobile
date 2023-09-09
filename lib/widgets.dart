import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_yatra/elements/increment.dart';
import 'package:easy_yatra/screens/Bookings/HotelMaps.dart';
import 'package:easy_yatra/screens/Bookings/ReviewBooking.dart';
import 'package:easy_yatra/screens/Home/HotelPreview.dart';
import 'package:easy_yatra/screens/empty_screens/location.dart';
import 'package:easy_yatra/styles.dart';
import 'package:easy_yatra/utils/constant.dart';

import 'screens/Bookings/ReviewBooking2.dart';

Widget smallCardUtility(
  Icon icon,
  String title,
  String subtitle,
) {
  return Expanded(
    child: Card(
      color: greyLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(1),
        side: const BorderSide(),
      ),
      child: Container(
        height: 30,
        padding: const EdgeInsets.all(2),
        child: Row(
          children: [
            icon,
            const SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: hotelPreviewBlackNormalText,
                ),
                Text(
                  subtitle,
                  style: hotelPreviewBlueText,
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}

// Widget confirmBookingCard(
//   String assetImage,
//   String type,
//   String name,
//   String description,
//   int rating,
// ) {
//   return Card(
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(10),
//     ),
//     child: Container(
//       padding: const EdgeInsets.all(15),
//       child: Row(
//         children: [
//           Container(
//             width: 120,
//             height: 100,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               image: DecorationImage(
//                 image: AssetImage(
//                   assetImage,
//                 ),
//                 fit: BoxFit.fill,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   type,
//                   textAlign: TextAlign.start,
//                   style: bookingCardBlueText,
//                 ),
//                 Container(
//                   padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
//                   width: 170,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         name,
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                         style: hotelName,
//                       ),
//                       Text(
//                         description,
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                         style: greyText,
//                       ),
//                     ],
//                   ),
//                 ),
//                 RatingBar.builder(
//                   initialRating: 3,
//                   itemCount: 5,
//                   itemSize: 15,
//                   itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
//                   itemBuilder: (context, _) => Icon(
//                     Icons.star,
//                     color: Colors.amber[900],
//                   ),
//                   onRatingUpdate: (onRatingUpdate) {
//                     print(onRatingUpdate);
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

Widget popularSearchesTag(String tag) {
  return InkWell(
    onTap: () {
      // print(tag);
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(
            color: grey,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Text(
          tag,
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: grey,
          ),
        ),
      ),
    ),
  );
}

Widget quotesContainer(BuildContext context, String quote) {
  return Container(
    color: searchBarColor,
    width: MediaQuery.of(context).size.width,
    padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
    child: Text(
      quote,
      textAlign: TextAlign.center,
      style: GoogleFonts.fraunces(
          fontSize: 16, fontWeight: FontWeight.w600, color: darkBlue),
    ),
  );
}

Widget smallOfferCard(BuildContext context) {
  return Container(
    height: 120,
    width: MediaQuery.of(context).size.width * 0.8,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/res/offers.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '10% Instant savings',
                        style: offerCardTitle,
                      ),
                      Container(
                        height: 2,
                        width: 33,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: const Color.fromRGBO(255, 75, 38, 1.0),
                        ),
                      ),
                      Container(
                        width: 190,
                        child: Text(
                          'Save more than 10% on booking with Easyatra.',
                          softWrap: true,
                          maxLines: 2,
                          style: GoogleFonts.lato(
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 8, 5, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'T&C Apply',
                    style: GoogleFonts.lato(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "View Details",
                      style: GoogleFonts.lato(
                        color: activeBlueColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget itemCard(
  BuildContext context,
  int bPrice,
  int aPrice,
  double rating,
  String imageAsset,
  String name,
  String area,
  String description,
) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.94,
    height: height(context) * 0.45,
    margin: const EdgeInsets.all(10),
    child: Card(
      elevation: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HotelPreviewPage(
                                bPrice: bPrice,
                                aPrice: aPrice,
                                rating: rating,
                                imageAsset: imageAsset,
                                name: name,
                                area: area,
                                description: description)));
                  },
                  child: Image.asset(
                    imageAsset,
                    fit: BoxFit.fill,
                    height: 191,
                    width: width(context),
                  ),
                ),
                Positioned(
                  top: 5,
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
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            height: height(context) * 0.13,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      name,
                      style: hotelName,
                    ),
                    Text(
                      area,
                      style: greyText,
                    ),
                    Row(
                      children: [
                        RatingBar.builder(
                          initialRating: 4.2,
                          itemCount: 5,
                          itemSize: 18,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 1.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber[900],
                          ),
                          onRatingUpdate: (onRatingUpdate) {
                            print(onRatingUpdate);
                          },
                        ),
                        Container(
                          // height: 20,
                          width: 40,
                          // padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                          decoration: BoxDecoration(
                            color: pink,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              "$rating/5",
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '₹ $bPrice',
                      style: GoogleFonts.lato(
                        decoration: TextDecoration.lineThrough,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black38,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '₹ $aPrice',
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
                    addVerticalSpace(6),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget listedDots() {
  return Container(
    height: 5,
    width: 5,
    decoration: BoxDecoration(
      color: Colors.black,
      border: Border.all(
        color: Colors.black,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
    ),
  );
}

Widget blueListedDots() {
  return Container(
    height: 5,
    width: 5,
    decoration: BoxDecoration(
      color: const Color.fromRGBO(61, 153, 238, 1),
      border: Border.all(
        color: const Color.fromRGBO(61, 153, 238, 1),
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
    ),
  );
}

Widget layoutContainer(BuildContext context) {
  return Container(
    height: 100,
    width: width(context) * 0.95,
    decoration: const BoxDecoration(
      color: Color.fromRGBO(217, 230, 241, 1),
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
    child: Stack(
      children: [
        Positioned(
          left: 10,
          top: 10,
          child: blueListedDots(),
        ),
        const Positioned(
          left: 20,
          top: 6,
          child: Text(
            "Room Only",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
          ),
        ),
        Positioned(
          left: 30,
          top: 35,
          child: listedDots(),
        ),
        const Positioned(
          left: 42,
          top: 30,
          child: Text(
            "No meals included.",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ),
        Positioned(
          left: 30,
          top: 50,
          child: listedDots(),
        ),
        const Positioned(
          left: 42,
          top: 45,
          child: Text(
            "Non-refundable",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ),
        Positioned(
          left: 30,
          top: 65,
          child: listedDots(),
        ),
        const Positioned(
          left: 42,
          top: 60,
          child: Text(
            "City View",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ),
        const Positioned(
          left: 250,
          top: 10,
          child: Text(
            "\u{20B9}1,493",
            style: TextStyle(
              color: Color.fromRGBO(218, 65, 103, 1),
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const Positioned(
          left: 285,
          top: 40,
          child: Text(
            "\u{20B9}4,433",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ),
        const Positioned(
          left: 222,
          top: 60,
          child: Text(
            "+ \u{20B9} 594 taxes and fee",
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(94, 94, 94, 1),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget layoutContainer2() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(17, 0, 10, 0),
    child: Container(
      height: 100,
      width: 350,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(217, 230, 241, 1),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 10,
            top: 10,
            child: blueListedDots(),
          ),
          const Positioned(
            left: 20,
            top: 6,
            child: Text(
              "Room with breakfast",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
            ),
          ),
          Positioned(
            left: 30,
            top: 35,
            child: listedDots(),
          ),
          const Positioned(
            left: 42,
            top: 30,
            child: Text(
              "No meals included.",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ),
          Positioned(
            left: 30,
            top: 50,
            child: listedDots(),
          ),
          const Positioned(
            left: 42,
            top: 45,
            child: Text(
              "Non-refundable",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ),
          Positioned(
            left: 30,
            top: 65,
            child: listedDots(),
          ),
          const Positioned(
            left: 42,
            top: 60,
            child: Text(
              "City View",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget customNavigationBar(BuildContext context) {
  return SizedBox(
    height: 90,
    child: Container(
      height: 90,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: blueGradient(),
      ),
      child: Stack(
        children: [
          const Positioned(
            left: 10,
            top: 20,
            child: Text(
              "\u{20B9}1,493",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
          ),
          const Positioned(
            left: 80,
            top: 30,
            child: Text(
              "+ \u{20B9} 594 taxes and fee",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Positioned(
            left: 220,
            top: 10,
            child: Container(
              height: 40,
              width: 130,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const ReviewBooking2())));
                },
                child: const Text(
                  "Continue",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget incrementButton(BuildContext context) {
  return Container(
    width: 60,
    padding: const EdgeInsets.all(3),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: Colors.white,
    ),
    child: Row(
      children: [
        InkWell(
          onTap: () {},
          child: const Icon(
            Icons.remove,
            color: Color.fromRGBO(94, 94, 94, 1),
            size: 16,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 3),
          padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3), color: Colors.white),
          child: const Text(
            '3',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
        InkWell(
          onTap: () {},
          child: const Icon(
            Icons.add,
            color: Color.fromRGBO(94, 94, 94, 1),
            size: 16,
          ),
        ),
      ],
    ),
  );
}

Widget cardSmall(context) {
  return Container(
    decoration: const BoxDecoration(),
    height: height(context) * 0.32,
    padding: const EdgeInsets.fromLTRB(5, 5, 5, 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          // padding: const EdgeInsets.symmetric(
          //   vertical: 5,
          // ),
          width: 300,
          height: height(context) * 0.12,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            image: DecorationImage(
              image: AssetImage(
                'assets/res/style.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          decoration: BoxDecoration(
            border: Border.all(
              width: 0.5,
            ),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          width: 300,
          height: height(context) * 0.15,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Luxe Double Room',
                    style: offerCardTitle,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            listedDots(),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: Text('Room Only'),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            listedDots(),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: Text('Non-Refundable'),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            listedDots(),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: Text('Breakfast'),
                            ),
                          ],
                        ),
                        addVerticalSpace(5),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '₹ 4,433',
                    style: GoogleFonts.lato(
                      decoration: TextDecoration.lineThrough,
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '₹ 3,493',
                    style: smallBoldText,
                  ),
                  Text(
                    '+ ₹ 594 taxes and fee',
                    style: greyText,
                  ),
                  Text(
                    'Per night',
                    style: greyText,
                  ),
                  addVerticalSpace(5)
                ],
              )
            ],
          ),
        ),
      ],
    ),
  );
}

Widget myBookingsCard(BuildContext context) {
  return Container(
    height: height(context) * 0.32,
    margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(blurRadius: 1, color: Colors.grey)]),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 5,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "AUG",
                  style: TextStyle(
                      color: Color.fromRGBO(61, 153, 238, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "23",
                  style: TextStyle(
                      color: Color.fromRGBO(61, 153, 238, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "Monday",
                  style: TextStyle(
                      color: Color.fromRGBO(61, 153, 238, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(
              width: 8,
            ),
            const DottedLine(
              direction: Axis.vertical,
              lineLength: 150,
              lineThickness: 1,
            ),
            SizedBox(
              width: width(context) * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: Text(
                      '2 Nights - 2 Guests',
                      style:
                          TextStyle(color: pink, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 22.0),
                    child: Text(
                      ' At Clark Inn Suits',
                      style: bodytext18Ww600,
                    ),
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Booking ID',
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              'u4398489',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Date of checkout',
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              '26-5-22',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        const Divider(
          thickness: 1,
          height: 0,
          color: Colors.black,
        ),
        SizedBox(
          height: height(context) * 0.04,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.05,
                decoration: BoxDecoration(
                    gradient: blueGradient(),
                    borderRadius: BorderRadius.circular(30)),
                // padding: const EdgeInsets.fromLTRB(30, 13, 30, 10),
                child: const Center(
                  child: Text(
                    'CANCEL BOOKING',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HotelMapsScreen()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.05,
                decoration: BoxDecoration(
                    gradient: blueGradient(),
                    borderRadius: BorderRadius.circular(30)),
                // padding: const EdgeInsets.fromLTRB(30, 13, 30, 10),
                child: Center(
                  child: Text(
                    'Hotel Location'.toUpperCase(),
                    style: TextStyle(fontSize: 14, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}

Widget LoadingState(String message, TextStyle style) {
  return Center(
    child: Container(
      color: white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CircularProgressIndicator(),
          ),
          addVerticalSpace(20),
          Center(
            child: Text(
              message,
              style: style,
            ),
          )
        ],
      ),
    ),
  );
}

Widget rewardCard(
    Function()? onTap, double screenWidth, double screenHeight, String text) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(screenWidth / 40),
      margin: EdgeInsets.all(screenWidth / 100),
      height: screenHeight * 0.5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(105, 112, 255, 179),
            Color.fromARGB(155, 202, 249, 252),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              text,
              style: kBodyText20wNormal(black),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ),
  );
}

class Clipper extends CustomClipper<Rect> {
  final int part;

  Clipper({required this.part});
  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(
        (size.width / 10) * part, 0.0, size.width, size.height);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return true;
  }
}

void showToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    gravity: ToastGravity.BOTTOM, // Location of the toast (e.g., top, center, bottom)
    timeInSecForIosWeb: 1, // Duration for iOS (in seconds)
    backgroundColor: Colors.grey, // Background color of the toast
    textColor: Colors.white, // Text color of the toast
    fontSize: 16.0, // Font size of the message
  );
}

imageNetwork(String url, {BoxFit fit = BoxFit.cover}) {
  return CachedNetworkImage(
    imageUrl: url,
    placeholder: (context, url) => SizedBox(),
    errorWidget: (context, url, error) => Icon(Icons.error),
    fit: fit,
  );
}

networkImage(String url) {
  return CachedNetworkImageProvider(url);
}
