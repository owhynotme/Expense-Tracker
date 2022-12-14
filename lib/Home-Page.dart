import 'package:expensetracker/User-Card.dart';
import 'package:flutter/material.dart';
import 'package:expensetracker/nav-page.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return NavPage();
    // return cardUI();
  }
}
