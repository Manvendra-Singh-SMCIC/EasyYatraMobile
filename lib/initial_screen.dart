import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_yatra/screens/Bookings/BookingHistory.dart';
import 'package:easy_yatra/screens/Bookings/HOtelMaps.dart';
import 'package:easy_yatra/screens/Home/HomeScreen.dart';
import 'package:easy_yatra/screens/Bookings/ReviewBooking2.dart';
import 'package:easy_yatra/screens/Hosting/Hosting.dart';
import 'package:easy_yatra/screens/empty_screens/Wishlist_empty.dart';
import 'package:easy_yatra/screens/Notifications/Notifications.dart';
import 'package:easy_yatra/styles.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class InitialScreenPage extends StatefulWidget {
  const InitialScreenPage({Key? key}) : super(key: key);

  @override
  State<InitialScreenPage> createState() => _InitialScreenPageState();
}

class _InitialScreenPageState extends State<InitialScreenPage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreenPage(),
    // bookingsPage(),
    BookHistory(),
    NotificationPage(visible: false),
    hostingPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  DateTime? currentBackPressTime;

  Future<bool> _onWillPop() async {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Press back again to exit'),
          duration: Duration(seconds: 2),
        ),
      );
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: _onWillPop,
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_rounded,
              size: 25,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmark_added_rounded,
            ),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications_rounded,
            ),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.swap_calls_rounded,
            ),
            label: 'Hosting',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: darkBlue,
        onTap: _onItemTapped,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );
  }
}
