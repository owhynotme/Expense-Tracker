import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
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
              child: Card(
                elevation: 30,
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
                      // decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(40)),
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
              height: 90,
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
            )
          ],
        )),
      ),
    );
  }
}
