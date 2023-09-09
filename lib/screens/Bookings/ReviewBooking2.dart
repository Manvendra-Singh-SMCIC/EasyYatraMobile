import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_yatra/styles.dart';
import 'package:easy_yatra/utils/constant.dart';

import 'ReviewBooking.dart';

class ReviewBooking2 extends StatefulWidget {
  const ReviewBooking2({super.key});

  @override
  State<ReviewBooking2> createState() => _ReviewBooking2State();
}

class _ReviewBooking2State extends State<ReviewBooking2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        title: const Text(
          "Confirm Booking",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              height: height(context) * 0.18,
              width: width(context) * 0.95,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [BoxShadow(blurRadius: 2, color: Colors.grey)]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: height(context) * 0.14,
                    width: width(context) * 0.3,
                    child: Image.asset(
                      'assets/res/booking1.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text('Hotel',
                            style: TextStyle(color: darkBlue, fontSize: 12)),
                        Text('Clarks Inn Suits', style: bodytext18Ww600),
                        const Text('New Prem Nagar, Lorem Ipsum',
                            style:
                                TextStyle(color: Colors.black45, fontSize: 12)),
                        RatingBar.builder(
                          initialRating: 4,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 15,
                          itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                          itemBuilder: (context, _) =>
                              Icon(Icons.star, color: Colors.amber),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Divider(
              height: 30,
              thickness: 10,
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: height(context) * 0.22,
              width: width(context) * 0.95,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [BoxShadow(blurRadius: 2, color: Colors.grey)]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Your Booking',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dates',
                            style: bodytext18Ww600,
                          ),
                          Text('19-21 Sept', style: TextStyle(fontSize: 16))
                        ],
                      ),
                      TextButton(onPressed: () {}, child: Text('Edit'))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Guests',
                            style: bodytext18Ww600,
                          ),
                          Text('1 guest', style: TextStyle(fontSize: 16))
                        ],
                      ),
                      TextButton(onPressed: () {}, child: Text('Edit'))
                    ],
                  )
                ],
              ),
            ),
            const Divider(
              height: 30,
              thickness: 10,
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: height(context) * 0.25,
              width: width(context) * 0.95,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [BoxShadow(blurRadius: 2, color: Colors.grey)]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Price details',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '₹5,000 x 2 nights',
                        style: bodytext18Ww600,
                      ),
                      Text(
                        '₹10,000',
                        style: bodytext18Ww600,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Service fee',
                        style: bodytext18Ww600,
                      ),
                      Text(
                        '₹1,500',
                        style: bodytext18Ww600,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'GST',
                        style: bodytext18Ww600,
                      ),
                      Text(
                        '₹1,500',
                        style: bodytext18Ww600,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total (INR)',
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: darkBlue,
                        ),
                      ),
                      Text(
                        '₹13,000',
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: darkBlue,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Cancellation Policy',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: RichText(
                  text: const TextSpan(children: [
                TextSpan(
                    text: 'Non-refundable (₹13,000.76)',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500)),
                TextSpan(
                    text: 'This reservation is non-refundable',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ))
              ])),
            ),
            const Divider(
              height: 30,
              thickness: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: RichText(
                  text: const TextSpan(children: [
                TextSpan(
                    text: 'By selecting continue, I agree to hotel booking’s ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500)),
                TextSpan(
                    text: 'Terms of service and  Privacy policy',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 12,
                    ))
              ])),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ReviewBooking()));
              },
              child: Container(
                margin: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 0.95,
                height: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(
                    gradient: blueGradient(),
                    borderRadius: BorderRadius.circular(30)),
                // padding: const EdgeInsets.fromLTRB(30, 13, 30, 10),
                child: const Center(
                  child: Text(
                    'Continue',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
