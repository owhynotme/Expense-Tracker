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
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final enter_Amount = TextEditingController();
  final enter_Transaction = TextEditingController();
  bool isChecked = false;
  bool isIncome = false;

  void startLoading() {
    timerHasStarted = true;
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (GoogleSheetsApi.loading == false) {
        setState(() {});
        timer.cancel();
      }
    });
  }

  void tempPrint() {}
// New Transactions
  // void enterTransaction() {
  //   GoogleSheetsApi.insertTrans(
  //     'YouTube',
  //     '230',
  //     true,
  //   );
  //   setState(() {});
  // }
  void enterTransaction() {
    GoogleSheetsApi.insert(
      enter_Transaction.text,
      enter_Amount.text,
      isIncome,
    );
    setState(() {});
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Transactions',
                              style: GoogleFonts.roboto(
                                  fontSize: 20, fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: GoogleSheetsApi.loading == true
                              ? loadingind()
                              : ListView.builder(
                                  itemCount: GoogleSheetsApi
                                      .currentTransactions.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
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

              Container(
                child: ElevatedButton(
                  onPressed: () {
                    // await showAboutDialog(context);
                    showDialog(
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(builder: (context, setState) {
                          return AlertDialog(
                            title: Text(
                              'NEW TRANSACTION',
                            ),
                            content: Form(
                              key: _formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text('Expense'),
                                      Switch(
                                        value: isIncome,
                                        onChanged: (newValue) {
                                          setState(() {
                                            isIncome = newValue;
                                          });
                                        },
                                      ),
                                      Text('Income'),
                                    ],
                                  ),
                                  TextFormField(
                                    validator: (value) {
                                      // return value?.isEmpty ? null:"Enter Amount";
                                      return value!.isNotEmpty
                                          ? null
                                          : "Amount?";
                                    },
                                    decoration: InputDecoration(
                                        hintText: 'Enter Amount',
                                        border: OutlineInputBorder()),
                                    controller: enter_Amount,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    validator: (value) {
                                      // return value?.isEmpty ? null:"Enter Amount";
                                      return value!.isNotEmpty
                                          ? null
                                          : "Transaction Name?";
                                    },
                                    decoration: InputDecoration(
                                        hintText: 'Enter Transaction Name',
                                        border: OutlineInputBorder()),
                                    controller: enter_Transaction,
                                  ),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              // Row(
                              //   children: [
                              //     Checkbox(
                              //       value: isChecked,
                              //       onChanged: (checked) {
                              //         setState(
                              //           () {
                              //             isChecked = checked!;
                              //           },
                              //         );
                              //       },
                              //     )
                              //   ],
                              // ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                // crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  // TextButton(
                                  //   onPressed: (() {
                                  //     Navigator.pop(context);
                                  //   }),
                                  //   child: Text('Cancel'),
                                  // ),

                                  // TextButton(
                                  //   child: Text('Submit'),
                                  //   onPressed: (() {
                                  //     if (_formKey.currentState!.validate()) {
                                  //       enter_Transaction;
                                  //       Navigator.pop(context);
                                  //     }
                                  //   }),
                                  // ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: MaterialButton(
                                      // color: Colors.grey[600],
                                      child: Text('Cancel',
                                          style:
                                              TextStyle(color: Colors.black)),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ),

                                  MaterialButton(
                                    color: Colors.grey[600],
                                    child: Text('Enter',
                                        style: TextStyle(color: Colors.white)),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        enterTransaction();
                                        Navigator.of(context).pop();
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ],
                          );
                        });
                      },
                    );
                  },
                  child: Text(
                    '+',
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
