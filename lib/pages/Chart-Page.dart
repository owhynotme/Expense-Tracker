import 'package:flutter/material.dart';
import 'package:expensetracker/Google-Sheets-API.dart';
import 'package:get_storage/get_storage.dart';

// class getChartData{
// int shopping=0;
//   getChartData({});
// }

class ChartData extends StatefulWidget {
  // const ChartData({super.key});
  @override
  State<ChartData> createState() => _ChartDataState();
}

class _ChartDataState extends State<ChartData> {

    final categoryamt = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pie Chart',
        ),
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        child: Text('data'),
      ),
    );
  }
}
