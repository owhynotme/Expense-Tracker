import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransPage extends StatelessWidget {
  final String transactionName;
  final String amount;
  final String incomeExpense;
  // final String comments;

  TransPage({
    required this.transactionName,
    required this.amount,
    required this.incomeExpense,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          color: Colors.grey[300],
          height: 70,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/rupee_icon.png',
                    height: 25,
                    width: 25,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(right: 110),
                  //   child:
                  Padding(
                    padding: const EdgeInsets.only(right: 140),
                    child: Text(
                      transactionName,
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600, fontSize: 17),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // ),
                      // Text(),
                      Text(
                          (incomeExpense == 'income' ? '+ ' : '- ') +
                              '\u{20B9} $amount',
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w800,
                              fontSize: 17,
                              color: (incomeExpense == 'income'
                                  ? Colors.green[400]
                                  : Colors.red[800]))),
                    ],
                  ),
                  // Text(transactionName,
                  //     style: GoogleFonts.inter(
                  //         fontWeight: FontWeight.w600, fontSize: 17)),
                  // // ),
                  // // Text(),
                  // Text(
                  //     (incomeExpense == 'income' ? '+ ' : '- ') +
                  //         '\u{20B9} $amount',
                  //     style: GoogleFonts.montserrat(
                  //         fontWeight: FontWeight.w800,
                  //         fontSize: 17,
                  //         color: (incomeExpense == 'income'
                              // ? Colors.green[400]
                  //             : Colors.red[800]))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
