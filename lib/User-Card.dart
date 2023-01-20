import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gsheets/gsheets.dart';
import 'Google-Sheets-API.dart';
import 'package:firebase_auth/firebase_auth.dart';

class cardUI extends StatelessWidget {
  const cardUI({super.key});
  // cardUI({required this.balance});
  @override
  Widget build(BuildContext context) {
    String firstName;
    String lastName;
    final user = FirebaseAuth.instance.currentUser!;
    if (user.email == 'yashasviwadhwa924@gmail.com') {
      firstName = 'Yashasvi';
      lastName = 'Wadhwa';
    } else {
      firstName = 'Tarun';
      lastName = 'Kochhar';
    }
    int limit = 20000;
    limit -= (GoogleSheetsApi.calculateExpense().toInt());
    // print('Expense \n');
    // print(limit);
    limit += (GoogleSheetsApi.calculateIncome().toInt());
    // print('Income \n');
    // print(limit);
    int balance = limit;
    // print('Balance \n');
    // print(limit);

    // int balance = 700;
    //Low Balance Check
    // double per = limit * 0.90;
    // print(per);
    // if (balance == (limit - per)) {
    // if (balance < 800) {
    //   showDialog(
    //     context: context,
    //     builder: (context) {
    //       return AlertDialog(
    //         title: Text('Warning!! \n90% Limit Used'),
    //         actions: [
    //           MaterialButton(
    //               child: Text(
    //                 'Cancel',
    //                 style: TextStyle(color: Colors.black),
    //               ),
    //               onPressed: (() {
    //                 Navigator.of(context).pop();
    //               }))
    //         ],
    //       );
    //     },
    //   );
    // }

    return Container(
      height: 224,
      // color: Colors.grey,
      child: Expanded(
        child: Card(
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(30.0),
          // ),
          color: Colors.black,
          elevation: 90,
          shadowColor: Colors.grey,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
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
                          height: 74,
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
                          // '\u{20B9}${limit}',
                          '20000',
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
                      firstName + '  ' + lastName,
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
