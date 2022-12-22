import 'dart:async';

import 'package:expensetracker/Google-Sheets-API.dart';
import 'package:expensetracker/Plus-Button.dart';
import 'package:expensetracker/User-card.dart';
import 'package:expensetracker/pages/loading-page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gsheets/gsheets.dart';
import 'Google-Sheets-API.dart';

import 'Trasactions.dart';
// import 'Transaction.dart';

class UIhomePage extends StatefulWidget {
  const UIhomePage({super.key});

  @override
  State<UIhomePage> createState() => _UIhomePageState();
}

class _UIhomePageState extends State<UIhomePage> {
  // wait for the data to be fetched from google sheets
  bool timerHasStarted = false;

  void startLoading() {
    timerHasStarted = true;
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (GoogleSheetsApi.loading == false) {
        setState(() {});
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (GoogleSheetsApi.loading == true && timerHasStarted == false) {
      startLoading();
    }

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
                height: 25,
              ),
              Expanded(
                child: Container(
                  child: Center(
                    child: Column(
                      children: [
                        // TransPage(),
                        // Expanded(
                        //   child: ListView.builder(
                        //     itemCount: GoogleSheetsApi.currentTransactions.length,
                        //       itemBuilder: ((BuildContext context, int index) {
                        //     return ListTile(
                        //       leading: Icon(Icons.person),
                        //       trailing: Icon(Icons.phone_android),
                        //       title: Text('Call $index'),
                        //     );
                        //   })),
                        // ),

                        Expanded(
                          child: GoogleSheetsApi.loading==true?loadingind() : ListView.builder(
                            itemCount:
                                GoogleSheetsApi.currentTransactions.length,
                            itemBuilder: (BuildContext context, int index) {
                              return TransPage(
                                  transactionName: GoogleSheetsApi
                                      .currentTransactions[index][0],
                                  amount: GoogleSheetsApi
                                      .currentTransactions[index][1],
                                  incomeExpense: GoogleSheetsApi
                                      .currentTransactions[index][2]);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              addTrans(),
            ],
          ),
        ),
      ),
    );
  }
}
