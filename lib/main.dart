import 'package:expensetracker/Google-Sheets-API.dart';
import 'package:expensetracker/Main-Page.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoogleSheetsApi().init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // await sheet!.values.insertValue('PiPo', column: 1, row: 2);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(brightness: Brightness.dark),
    );
  }
}
