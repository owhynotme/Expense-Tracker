import 'package:flutter/material.dart';

class loadingind extends StatelessWidget {
  const loadingind({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 25,
        width: 25,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
