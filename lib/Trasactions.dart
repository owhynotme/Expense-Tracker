import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransPage extends StatelessWidget {
  final String transactionName;
  final int amount;
  final String incomeExpense;
  // final String comments;

  TransPage({
    required this.transactionName,
    required this.amount,
    required this.incomeExpense,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
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
                  height: 30,
                  width: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 110),
                  child: Text(transactionName,
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600, fontSize: 20)),
                ),
                // Text(),
                Text(
                    (incomeExpense == 'income' ? '+ ' : '- ') +
                        '\u{20B9} $amount',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                        color: (incomeExpense == 'income'
                            ? Colors.green[400]
                            : Colors.red[800]))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
