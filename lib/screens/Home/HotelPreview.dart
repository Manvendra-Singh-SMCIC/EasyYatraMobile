import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_yatra/screens/empty_screens/PropertyType.dart';
import 'package:easy_yatra/styles.dart';
import 'package:easy_yatra/utils/constant.dart';
import 'package:easy_yatra/widgets.dart';
import 'package:number_to_words/number_to_words.dart';
import 'package:number_to_words_english/number_to_words_english.dart';

import '../../utils/expandable_text.dart';

class HotelPreviewPage extends StatefulWidget {
  final int bPrice;
  final int aPrice;
  final double rating;
  final String imageAsset;
  final String name;
  final String area;
  final String description;

  HotelPreviewPage(
      {Key? key,
      required this.bPrice,
      required this.aPrice,
      required this.rating,
      required this.imageAsset,
      required this.name,
      required this.area,
      required this.description})
      : super(key: key);

  @override
  State<HotelPreviewPage> createState() => _HotelPreviewPageState();
}

class _HotelPreviewPageState extends State<HotelPreviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        // padding: EdgeInsets.only(bottom: 50),
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: activeBlueColor,
                expandedHeight: 280,
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.all(5),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                actionsIconTheme: const IconThemeData(
                  size: 20,
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.all(10),
                      ),
                      child: const Icon(
                        Icons.share_rounded,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.all(10),
                      ),
                      child: const Icon(
                        Icons.bookmark_add,
                        size: 22,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
                flexibleSpace: Stack(
                  fit: StackFit.expand,
                  children: const [
                    Image(
                      image: AssetImage(
                        'assets/res/hotel_img_two.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ];
          },
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 45,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Clarks Suits Inn',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.lato(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 24,
                                  ),
                                ),
                                Text(
                                  'New Prem Nagar, Lorem Ipsum',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: HotelPreviewGreyText,
                                ),
                              ],
                            ),
                            RatingBar.builder(
                              initialRating: 3,
                              itemCount: 5,
                              itemSize: 20,
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
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 3,
                        color: greyLight,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Best Offer',
                                      style: clickableEditButton,
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    Text(
                                      '+ ₹ 594 taxes and fee',
                                      style: GoogleFonts.lato(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: greyMedium,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '₹1,493',
                                      style: pinkBoldText,
                                    ),
                                    Text(
                                      '₹ 4,433',
                                      style: GoogleFonts.lato(
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: 15,
                                        color: Colors.black45,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                smallCardUtility(
                                  const Icon(
                                    Icons.calendar_today_rounded,
                                    size: 25,
                                    color: greyMedium,
                                  ),
                                  'Check In & Check Out',
                                  '20 Aug Sat - 21 Aug Sun',
                                ),
                                smallCardUtility(
                                  const Icon(
                                    Icons.person_outline_rounded,
                                    size: 25,
                                    color: greyMedium,
                                  ),
                                  'Guests & Rooms',
                                  '1 Guest/ 1 Room',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 3,
                        color: greyLight,
                      ),
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.255,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/res/maps.png',
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.location_on_rounded,
                                  size: 25,
                                  color: greyDark,
                                ),
                                Text(
                                  'Near Lonavala treasure Island Resort -382813',
                                  style: hotelPreviewGreyTextMedium,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 3,
                        color: greyLight,
                      ),
                      // listHeadingWidget('Style type of Room', false),

                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, top: 10, bottom: 10),
                        child: Text(
                          'Select type of room',
                          style: bodytext18Ww600,
                        ),
                      ),
                      SizedBox(
                        height: height(context) * 0.32,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, i) {
                              return cardSmall(context);
                            }),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 3,
                        color: greyLight,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: activeBlueColor,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 5,
                                      horizontal: 10,
                                    ),
                                    child: Text(
                                      '8.9',
                                      style: GoogleFonts.lato(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                                Text(
                                  'Overall Ratings',
                                  textAlign: TextAlign.start,
                                  style: clickableEditButton,
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 20,
                                color: activeBlueColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        height: 1,
                        thickness: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 12,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 3,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Cleanliness',
                                          style: smallBoldTextProgresBar,
                                        ),
                                        Text('10'),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(500),
                                    ),
                                    height: 4,
                                    child: LinearProgressIndicator(
                                      value: 0.5,
                                      minHeight: 4,
                                      backgroundColor: Colors.grey[300],
                                      valueColor:
                                          const AlwaysStoppedAnimation<Color>(
                                        Colors.blue,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 12,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 3,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Comfort',
                                          style: smallBoldTextProgresBar,
                                        ),
                                        Text('10'),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(500),
                                    ),
                                    height: 4,
                                    child: LinearProgressIndicator(
                                      value: 0.7,
                                      backgroundColor: Colors.grey[300],
                                      valueColor:
                                          const AlwaysStoppedAnimation<Color>(
                                        Colors.blue,
                                      ),
                                      minHeight: 4,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 12,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 3,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Facilities',
                                          style: smallBoldTextProgresBar,
                                        ),
                                        Text('10'),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(500),
                                    ),
                                    height: 4,
                                    child: LinearProgressIndicator(
                                      value: 0.9,
                                      backgroundColor: Colors.grey[300],
                                      valueColor:
                                          const AlwaysStoppedAnimation<Color>(
                                        Colors.blue,
                                      ),
                                      minHeight: 4,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 3,
                        color: greyLight,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'About this Hotel',
                              style: hotelName,
                            ),
                            addVerticalSpace(4),
                            const ExpandableText(
                              text:
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis. Ut commodo efficitur neque. Ut diam quam, semper iaculis condimentum ac, vestibulum eu nisl.',
                              color: black,
                              size: 13,
                              textHeight: 50,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                        ),
                        child: Text(
                          'Amenities',
                          style: hotelName,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                listedDots(),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                                  child: Text(
                                    'Pool',
                                    style: blackBoldTextMedium,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                listedDots(),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                                  child: Text(
                                    'Gym',
                                    style: blackBoldTextMedium,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                listedDots(),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                                  child: Text(
                                    'Room Only',
                                    style: blackBoldTextMedium,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                listedDots(),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                                  child: Text(
                                    'Room Only',
                                    style: blackBoldTextMedium,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 3,
                        color: greyLight,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                        child: Text(
                          'Rules & Regulations',
                          style: hotelName,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis. Ut commodo efficitur neque. Ut diam quam, semper iaculis condimentum ac, vestibulum eu nisl.',
                          style: blackNormalText,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 3,
                        color: greyLight,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                        child: Text(
                          'Cancellation Policy',
                          style: hotelName,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis. Ut commodo efficitur neque. Ut diam quam, semper iaculis condimentum ac, vestibulum eu nisl.',
                          style: blackNormalText,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 3,
                        color: greyLight,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                        child: Text(
                          'Similar Hotels',
                          style: hotelName,
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
        width: MediaQuery.of(context).size.width,
        height: 87,
        decoration: const BoxDecoration(
          color: white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '₹ 1203',
                      style: blackBoldText,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0, left: 3),
                      child: Text(
                        '₹ 4,433',
                        style: GoogleFonts.lato(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: width(context) * 0.43,
                  child: Text(
                    NumberToWordsEnglish.convert(1203),
                    textAlign: TextAlign.start,
                    style: blackNormalText,
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => PropertyType())));
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.44,
                height: 50,
                decoration: BoxDecoration(
                    gradient: blueGradient(),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  'Book Now',
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
