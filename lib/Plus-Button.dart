import 'package:flutter/material.dart';

class addTrans extends StatelessWidget {
  const addTrans({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        height: 35,
        width: 35,
        decoration:
            BoxDecoration(color: Colors.grey[500], shape: BoxShape.circle),
        child: Center(
          child: Text('+'),
        ),
      ),
    );
  }
}
