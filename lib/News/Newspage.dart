import 'package:expensetracker/Google-Sheets-API.dart';
import 'package:flutter/material.dart';

import '../pages/loading-page.dart';

class blogTile extends StatelessWidget {
  final String imageUrl, title, desc;
  blogTile({
    required this.imageUrl,
    required this.title,
    required this.desc,
  });
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
                height: 74,
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
  // final String newsName = 'Holla';

  // News({required this.newsName});

  @override
  Widget build(BuildContext context) {
    // String desc = 'Random tring of code';
    return Scaffold(
      appBar: AppBar(
        title: Text('News Insights'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        // centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(7),
          child: Container(
            child: Image.asset(
              'assets/icons/news2.png',
            ),
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: GoogleSheetsApi.loading == true
                ? loadingind()
                : ListView.builder(
                    // itemCount: articles.length,
                    itemCount: GoogleSheetsapi2.currentNews.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return blogTile(
                        imageUrl: GoogleSheetsapi2.currentNews[index][0],
                        title: GoogleSheetsapi2.currentNews[index][1],
                        desc: GoogleSheetsapi2.currentNews[index][2],
                        // articleurl: GoogleSheetsapi2.currentNews[index][3],
                      );
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
