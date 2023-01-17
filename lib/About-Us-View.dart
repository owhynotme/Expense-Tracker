import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class Aboutus extends StatelessWidget {
  const Aboutus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(
          'Mind Your Cash',
          style: GoogleFonts.firaSans(
              color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 50, left: 20),
                child: Image.asset(
                  'assets/images/splash.png',
                  height: 100,
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                margin: EdgeInsets.only(left: 25),
                height: 200,
                width: 350,
                child: Text(
                  'This app will help you track your daily expense, with the latest trendy Financial news it will also also give Low Balance alert which will help you stay on track from overspending',
                  style: TextStyle(fontSize: 17),
                  textAlign: TextAlign.justify,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 90, left: 40),
                child: Text(
                  'Developed by Tarun Kochhar & Yashasvi Wadhwa',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
