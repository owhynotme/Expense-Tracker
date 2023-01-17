import 'package:expensetracker/Google-Sheets-API.dart';
import 'package:expensetracker/Main-Page.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoogleSheetsApi().init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await GetStorage.init();
  // await sheet!.values.insertValue('PiPo', column: 1, row: 2);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final wname = GetStorage();
    // if (user.email == 'yashasviwadhwa924@gmail.com') {
    //   wname.write('workname', 'yash');
    //   // if(wname.read('workname')!=null){
    //   // wname.write('workname', 'yash');
    //   // }
    //   // else{
    //   //   wname.remove('')
    //   // }
    // } else {
    //   wname.write('workname', 'Worksheet1');
    // }
    // print(wname.read('workname'));
    // print(user.email);

    return MaterialApp(
      home: MainPage(),
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(brightness: Brightness.dark),
    );
  }
}
