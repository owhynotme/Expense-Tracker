import 'package:expensetracker/Plus-Button.dart';
import 'package:expensetracker/User-card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Trasactions.dart';
// import 'Transaction.dart';

class UIhomePage extends StatelessWidget {
  const UIhomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 241, 242, 1),
      appBar: AppBar(
        // leading: Icon(
        //   Icons.apple,
        //   color: Colors.black,
        // ),
        leading: Container(
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/boy_cropped.jpg')),
          ),
        ),
        // centerTitle: true,
        title: Text(
          'HI TARUN',
          style: GoogleFonts.notoSerif(
              color: Colors.black, fontWeight: FontWeight.w700),
        ),
        // backgroundColor: Color.fromRGBO(238, 241, 242, 1),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              // cardUI(),
              cardUI(),
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child: Container(
                child: Center(
                  child: Column(
                    children: [
                      // TransPage(),
                      TransPage(
                          transactionName: 'Teaching',
                          amount: 800,
                          incomeExpense: 'income'),
                    ],
                  ),
                ),
              )),

              addTrans(),
            ],
          ),
        ),
      ),
    );
  }
}
