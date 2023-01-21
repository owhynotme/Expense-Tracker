import 'package:flutter/material.dart';
import 'package:expensetracker/Google-Sheets-API.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Chart-Data-Show.dart';

class ChartData extends StatefulWidget {
  // const ChartData({super.key});
  @override
  State<ChartData> createState() => _ChartDataState();
}

class _ChartDataState extends State<ChartData> {
  final categoryamt = GetStorage();

  @override
  Widget build(BuildContext context) {
    String catname, catamt;
    double shoppingAmt = 0,
        softwareAmt = 0,
        investAmt = 0,
        gadgetAmt = 0,
        commuteAmt = 0,
        miscellaneusAmt = 0;
    for (int i = 0; i < GoogleSheetsApi.categoriesType.length; i++) {
      catname = GoogleSheetsApi.categoriesType[i][0];
      catamt = GoogleSheetsApi.categoriesType[i][1];
      if (catname == 'shopping') {
        shoppingAmt += double.parse(catamt);
      } else if (catname == 'software') {
        softwareAmt += double.parse(catamt);
      } else if (catname == 'invest') {
        investAmt += double.parse(catamt);
      } else if (catname == 'gadget') {
        gadgetAmt += double.parse(catamt);
      } else if (catname == 'commute') {
        commuteAmt += double.parse(catamt);
      } else {
        miscellaneusAmt += double.parse(catamt);
      }
    }
    // print('Shopping ' + shoppingAmt.toString()+'\n');
    // print('Software ' + softwareAmt.toString()+'\n');
    // print('Invest ' + investAmt.toString()+'\n');

    return showData(
      // shoping,gadget,invest,software,commute,miscellaneus;
      shoping: shoppingAmt,
      gadget: gadgetAmt,
      invest: investAmt,
      software: softwareAmt,
      commute: commuteAmt,
      miscellaneus: miscellaneusAmt,
    );

    // Scaffold(
    //   appBar: AppBar(
    //     title: Text(
    //       'Pie Chart',
    //     ),
    //     foregroundColor: Colors.black,
    //     elevation: 0,
    //     backgroundColor: Colors.transparent,
    //   ),

    //   // body: return,
    //   // body: Container(
    //   //   child: Text('data'),
    //   // ),
    // );
  }
}
