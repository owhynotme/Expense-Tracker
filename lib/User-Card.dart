import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class cardUI extends StatelessWidget {
  const cardUI({super.key});

  @override
  Widget build(BuildContext context) {
    final int balance = 6900;

    return Container(
      height: 215,
      // color: Colors.grey,
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Image.asset(
                          'assets/images/mastercard.jpg',
                          height: 80,
                          width: 80,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'LIMIT  ',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10),
                      ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(right: 13, top: 15),
                        child: Text(
                          '\u{20B9}${9000}',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      "Current Balance",
                      style: GoogleFonts.sourceSansPro(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 130, 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // crossAxisAlignment: CrossAxisAlignment,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 70),
                      child: Image.asset('assets/images/nfcpng.png',
                          height: 20, width: 40),
                    ),

                    Text(
                      // '\u{20B9}${balance}',
                      '\u{20B9}${balance}',
                      style: GoogleFonts.robotoMono(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    // ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, bottom: 15),
                    child: Text(
                      'Tarun Kochhar',
                      style: GoogleFonts.lato(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 18),
                    child: Image.asset(
                      // Image.asset(
                      'assets/images/Cardpic2c.png',
                      height: 18,
                      // width: 150,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
