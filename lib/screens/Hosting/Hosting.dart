import 'package:flutter/material.dart';
import 'package:easy_yatra/elements/increment.dart';
import 'package:easy_yatra/global.dart';
import 'package:easy_yatra/styles.dart';
import 'package:easy_yatra/widgets.dart';

import '../../utils/constant.dart';

class hostingPage extends StatefulWidget {
  hostingPage({Key? key}) : super(key: key);

  @override
  State<hostingPage> createState() => _hostingPageState();
}

class _hostingPageState extends State<hostingPage> {
  int count1 = Global.hosting[0];
  int count2 = Global.hosting[1];

  int count3 = Global.hosting[2];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: SafeArea(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select rooms and guests',
              style: bodytext18Ww600,
            ),
            const Divider(
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Rooms'),
                Container(
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            if (count1 > 1) {
                              count1--;
                              setState(() {
                                Global.hosting[0] = count1;
                              });
                            }
                          },
                          icon: const Icon(Icons.remove_circle_outline)),
                      Text(count1.toString()),
                      IconButton(
                          onPressed: () {
                            count1++;
                            setState(() {
                              Global.hosting[0] = count1;
                            });
                          },
                          icon: const Icon(Icons.add_circle_outline)),
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Adults'),
                Container(
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            if (count2 > 1) {
                              count2--;
                              setState(() {
                                Global.hosting[1] = count2;
                              });
                            }
                          },
                          icon: const Icon(Icons.remove_circle_outline)),
                      Text(count2.toString()),
                      IconButton(
                          onPressed: () {
                            count2++;
                            Global.hosting[1] = count2;
                            setState(() {});
                          },
                          icon: const Icon(Icons.add_circle_outline)),
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Children'),
                Container(
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            if (count3 > 1) {
                              count3--;
                              setState(() {
                                Global.hosting[2] = count3;
                              });
                            }
                          },
                          icon: const Icon(Icons.remove_circle_outline)),
                      Text(count3.toString()),
                      IconButton(
                          onPressed: () {
                            count3++;
                            setState(() {
                              Global.hosting[2] = count3;
                            });
                          },
                          icon: const Icon(Icons.add_circle_outline)),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 0.99,
                height: MediaQuery.of(context).size.height * 0.05,
                decoration: BoxDecoration(
                    gradient: blueGradient(),
                    borderRadius: BorderRadius.circular(30)),
                // padding: const EdgeInsets.fromLTRB(30, 13, 30, 10),
                child: const Center(
                  child: Text(
                    'Apply',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    )));
  }
}
