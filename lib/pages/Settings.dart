import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:expensetracker/Google-Sheets-API.dart';
import 'package:get_storage/get_storage.dart';
import 'package:expensetracker/About-Us-View.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    // Worksheet name

    // List<Map> Categories = [
    //   {'name': 'Shopping', 'iconPath': 'assets/icons/shoppingicon.png'},
    //   {'name': 'Study', 'iconPath': 'assets/icons/study.png'},
    //   {'name': 'Gadget', 'iconPath': 'assets/icons/gadget.png'},
    //   {'name': 'Invest', 'iconPath': 'assets/icons/invest.png'},
    //   {'name': 'Software', 'iconPath': 'assets/icons/software.png'},
    //   {'name': 'Commute', 'iconPath': 'assets/icons/commute.png'},
    //   {'name': 'Miscellaneus', 'iconPath': 'assets/icons/miscellaneus.png'},
    // ];

    String name;
    if (user.email == 'yashasviwadhwa924@gmail.com') {
      name = 'Yash';
    } else {
      name = 'Tarun';
    }
    return SafeArea(
      child: Center(
        child: Scaffold(
            body: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/boy_cropped.jpg')),
                ),
                Text(
                  name,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Aboutus(),
                    ));
              },
              child: Card(
                elevation: 10,
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 8, left: 10),
                    // child:
                    Container(
                      height: 50,
                      width: 350,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8, left: 10),
                        child: Text(
                          'About Us',
                          style: GoogleFonts.lato(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    // ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 240,
            ),
            MaterialButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              color: Colors.black,
              child: Text(
                'Sign Out',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 200,
            ),
            Expanded(
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Version 2.1.7 '),
                  Icon(Icons.favorite_border),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
