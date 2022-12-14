import 'package:expensetracker/User-Card.dart';
import 'package:expensetracker/pages/Home.dart';
import 'package:expensetracker/pages/Search.dart';
import 'package:expensetracker/pages/Settings.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:expense/pages/Home.dart';
// import 'package:temp/pages/Search.dart';
// import 'package:temp/pages/Settings.dart';

class NavPage extends StatefulWidget {
  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int _customIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _customIndex = index;
    });
  }

  final List<Widget> _pages = [
    // Homie(),
    // Search(),
    cardUI(),
    Center(
      child: Text('Search Page'),
    ),
    Settings(),
    // Center(child: Text('Settings Page'),),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _pages[_customIndex],
        bottomNavigationBar: Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: GNav(
              backgroundColor: Colors.black,
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.grey.shade800,
              padding: EdgeInsets.all(15),
              gap: 8,
              selectedIndex: _customIndex,
              onTabChange: _navigateBottomBar,
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),

                // Like Page

                // GButton(
                //   icon: Icons.favorite,
                //   text: 'Likes',
                // ),
                GButton(
                  icon: Icons.search,
                  text: 'Search',
                ),
                GButton(
                  icon: Icons.settings,
                  text: 'Settings',
                ),
              ],
            ),
          ),
        ),
        // floatingActionButton: FloatingActionButton(onPressed: null),
      ),
    );
  }
}
