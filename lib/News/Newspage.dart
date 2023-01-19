import 'package:expensetracker/Google-Sheets-API.dart';
import 'package:flutter/material.dart';

class blogTile extends StatelessWidget {
  final String imageUrl, title, desc;
  blogTile({required this.imageUrl, required this.title, required this.desc});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Container(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(imageUrl))),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 13, left: 10),
              child: Container(
                height: 66,
                child: Text(
                  desc,
                  style: TextStyle(color: Colors.black54),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class News extends StatelessWidget {
  final String newsName = 'Holla';

  // News({required this.newsName});

  @override
  Widget build(BuildContext context) {
    // String desc = 'Random tring of code';
    return Scaffold(
      appBar: AppBar(
        title: Text('News Insights'),
      ),
      // body: Center(
        
      //   child: SingleChildScrollView(
      //     child: Container(
      //       child: ListView.builder(
      //         // itemCount: articles.length,
      //         itemCount: GoogleSheetsApi.currentNews.length,
      //         shrinkWrap: true,
      //         physics: ClampingScrollPhysics(),
      //         itemBuilder: (BuildContext context, int index) {
      //           return blogTile(
      //               imageUrl: GoogleSheetsApi.currentNews[index][0],
      //               title: GoogleSheetsApi.currentNews[index][1],
      //               desc: GoogleSheetsApi.currentNews[index][2]);
      //         },
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
