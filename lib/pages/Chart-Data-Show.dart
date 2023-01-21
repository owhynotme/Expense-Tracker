import 'package:flutter/material.dart';
import 'package:expensetracker/Google-Sheets-API.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:google_fonts/google_fonts.dart';

class showData extends StatelessWidget {
  // const showData({super.key});
  final double shoping, gadget, invest, software, commute, miscellaneus;
  showData(
      {required this.shoping,
      required this.gadget,
      required this.invest,
      required this.software,
      required this.commute,
      required this.miscellaneus});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spend Analysis'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: Container(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 15,
            ),
            PieChart(
              dataMap: {
                'Shopping': shoping,
                'Gadget': gadget,
                'Invest': invest,
                'Software': software,
                'Commute': commute,
                'Miscellaneus': miscellaneus
              },
              animationDuration: Duration(microseconds: 2000),
              chartRadius: 200,
              chartValuesOptions: ChartValuesOptions(
                chartValueStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                showChartValueBackground: true,
                showChartValuesInPercentage: true,
                // show
              ),
              legendOptions: LegendOptions(
                  legendTextStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  legendPosition: LegendPosition.right),
            ),
            // ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Category Wise Spendings',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              // textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 25,
            ),

            // Shopping
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Image.asset(
                            'assets/icons/shoppingicon.png',
                            height: 35,
                            width: 35,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Shopping',
                          style: GoogleFonts.poppins(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                        // SizedBox(
                        //   height: 40,
                        // ),
                        Container(
                          margin: EdgeInsets.only(left: 100),
                          child: Text(
                            '\u{20B9}  ' + shoping.toString(),
                            style: GoogleFonts.poppins(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),

                    // Gadget

                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Image.asset(
                            'assets/icons/gadget.png',
                            height: 35,
                            width: 35,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Gadget',
                          style: GoogleFonts.poppins(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                        // SizedBox(
                        //   height: 40,
                        // ),
                        Container(
                          margin: EdgeInsets.only(left: 120),
                          child: Text(
                            '\u{20B9}  ' + gadget.toString(),
                            style: GoogleFonts.poppins(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),

                    // Invest

                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Image.asset(
                            'assets/icons/invest.png',
                            height: 35,
                            width: 35,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Invest',
                          style: GoogleFonts.poppins(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                        // SizedBox(
                        //   height: 40,
                        // ),
                        Container(
                          margin: EdgeInsets.only(left: 130),
                          child: Text(
                            '\u{20B9}  ' + invest.toString(),
                            style: GoogleFonts.poppins(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),

                    // Software

                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Image.asset(
                            'assets/icons/software.png',
                            height: 35,
                            width: 35,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Software',
                          style: GoogleFonts.poppins(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                        // SizedBox(
                        //   height: 40,
                        // ),
                        Container(
                          margin: EdgeInsets.only(left: 110),
                          child: Text(
                            '\u{20B9}  ' + software.toString(),
                            style: GoogleFonts.poppins(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),

                    // Commute

                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Image.asset(
                            'assets/icons/commute.png',
                            height: 35,
                            width: 35,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Commute',
                          style: GoogleFonts.poppins(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                        // SizedBox(
                        //   height: 40,
                        // ),
                        Container(
                          margin: EdgeInsets.only(left: 100),
                          child: Text(
                            '\u{20B9}  ' + commute.toString(),
                            style: GoogleFonts.poppins(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),

                    // Miscellaneus

                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Image.asset(
                            'assets/icons/miscellaneus.png',
                            height: 35,
                            width: 35,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Miscellaneus',
                          style: GoogleFonts.poppins(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                        // SizedBox(
                        //   height: 40,
                        // ),
                        Container(
                          margin: EdgeInsets.only(left: 80),
                          child: Text(
                            '\u{20B9}  ' + miscellaneus.toString(),
                            style: GoogleFonts.poppins(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
