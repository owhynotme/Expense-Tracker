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
        title: Text('API Call'),
      ),
      body: Center(
        // child: Container(
        //   height: 300,
        //   width: 350,
        //   decoration: BoxDecoration(
        //       color: Colors.grey, borderRadius: BorderRadius.circular(20)),
        //   child: Center(child: Text('Hello')),
        // ),
        child: SingleChildScrollView(
          child: Container(
            child: ListView.builder(
              // itemCount: articles.length,
              itemCount: 5,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                return blogTile(
                    imageUrl:
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/1200px-Image_created_with_a_mobile_phone.png',
                    title:
                        'ONGC, Indian Oil Emerge As Top Profit-Making Public Sector Firms In 2021-22',
                    desc:
                        'New Delhi: The net profit of operating public sector enterprises jumped 50.87 per cent to ₹ 2.49 lakh crore during 2021-22, with ONGC, Indian Oil Corp, Power Grid, NTPC and SAIL emerging as the top five performers, according to a government survey.The net profit of operating central public sector enterprises (CPSEs) stood at ₹ 1.65 lakh crore in the previous fiscal.');
              },
            ),
          ),
        ),
      ),
    );
  }
}
