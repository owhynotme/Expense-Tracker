import 'package:flutter/material.dart';

class News extends StatelessWidget {
  final String newsName = 'Holla';

  // News({required this.newsName});

  @override
  Widget build(BuildContext context) {
    // String desc = 'Random tring of code';
    return Scaffold(
        appBar: AppBar(
          title: Text('NEWS'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150,
                width: 390,
                // decoration: BoxDecoration(
                //     color: Colors.grey,
                //     borderRadius: BorderRadius.circular(30)),
                child: Card(
                  color: Colors.blue,
                  elevation: 80,
                  shadowColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              newsName,
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                        ],
                      ),
                      // Column(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      //   children: [Text(desc)],
                      // )
                    ],
                  ),
                ),
              ),
              // Column(
              //   children: [Text('data')],
              // )
            ],
          ),
        ));
  }
}
