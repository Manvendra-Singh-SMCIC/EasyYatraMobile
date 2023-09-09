import 'package:flutter/material.dart';
import 'package:easy_yatra/screens/empty_screens/Wishlist_full.dart';
import 'package:easy_yatra/styles.dart';
import 'package:easy_yatra/utils/constant.dart';

class WishlistEmpty extends StatefulWidget {
  const WishlistEmpty({super.key});

  @override
  State<WishlistEmpty> createState() => _WishlistEmptyState();
}

class _WishlistEmptyState extends State<WishlistEmpty> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Wrap(
          alignment: WrapAlignment.center,
          // runSpacing: 40.0,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Image.asset(
                'assets/res/Travel.png',
              ),
            ),
            Wrap(
              alignment: WrapAlignment.center,
              runSpacing: 15,
              children: const [
                Text(
                  "Nothing Saved Yet",
                  style: TextStyle(color: Colors.black, fontSize: 28),
                ),
                Text(
                  "While exploring tap on heart icon \nto wishlist your favorite hotel",
                  style: TextStyle(
                    color: Color.fromRGBO(139, 139, 139, 100),
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: height(context) * 0.1),
              child: Wrap(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WishlistFull()));
                    },
                    // padding: const EdgeInsets.all(5.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: MediaQuery.of(context).size.height * 0.05,
                      decoration: BoxDecoration(
                          gradient: blueGradient(),
                          borderRadius:
                              BorderRadius.all(Radius.circular(80.0))),
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                      child: const Text(
                        'START EXPLORING',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: MediaQuery.of(context).size.height * 0.05,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 255, 255, 100),
                        border: Border.all(
                          color: const Color.fromRGBO(166, 166, 166, 80),
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(80),
                        ),
                      ),
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                      child: const Text(
                        "CREATE NEW",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
