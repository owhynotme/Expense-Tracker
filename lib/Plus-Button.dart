import 'package:flutter/material.dart';

class addTrans extends StatefulWidget {
  final addFunction;

  addTrans({this.addFunction});

  @override
  State<addTrans> createState() => _addTransState();
}

class _addTransState extends State<addTrans> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.addFunction,
      child: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Container(
          height: 38,
          width: 40,
          decoration:
              BoxDecoration(color: Colors.grey[500], shape: BoxShape.circle),
          child: Center(
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
