import 'package:flutter/material.dart';

class TransPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340,
      // width: 500,
      // color: Colors.grey,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: Colors.grey[300],
              height: 70,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('Transactions'), Text('\$ 690')],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
