import 'package:flutter/material.dart';

class TransPage extends StatelessWidget {
  // final String transactionName;
  // final int amount;
  // final String incomeExpense;
  // // final String comments;

  // MyTransaction({
  //   required this.transactionName,
  //   required this.money,
  //   required this.expenseOrIncome,
  // });

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
                //   Text(transactionName),
                //   Text('\u{20B9} $amount'),
                Text('transactionName'),
                Text('\u{20B9} 99'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
