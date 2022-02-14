import 'package:flutter/material.dart';
import 'package:just_app/screens/video_screen.dart';

//Tab (feed) class handler

class Feed extends StatelessWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    List feeds = <String>[
      'Today\'s',
      'Tomorrow\'s',
      'The day after tomorrow\'s'
    ];

    return Scaffold(
      body: SingleChildScrollView(
          child: SizedBox(
        width: width,
        height: height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: width,
              height: 200,
              child: const VideoScreen(),
            ),
            SizedBox(
              width: width,
              height: height * 0.4,
              child: ListView.builder(
                padding: const EdgeInsets.all(5.0),
                itemCount: feeds.length,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: width * 0.8,
                    height: 100,
                    child: Card(
                      elevation: 5,
                      child: Center(
                        child: Text(
                          '${feeds[index]}',
                          style: const TextStyle(fontSize: 26),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: width,
              child: Flexible(
                child: Center(
                  child: Table(
                    border: TableBorder.all(
                        width: 2,
                        color: Colors.black,
                        style: BorderStyle.solid),
                    children: const [
                      TableRow(
                          decoration: BoxDecoration(color: Colors.blueGrey),
                          children: [
                            Text(
                              " Trending",
                              style: TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              " Most Viewed",
                              style: TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.bold),
                            ),
                            Text(" New",
                                style: TextStyle(
                                    fontSize: 26, fontWeight: FontWeight.bold)),
                          ]),
                      TableRow(
                          decoration: BoxDecoration(color: Colors.grey),
                          children: [
                            Text(
                              " Fashion",
                              style: TextStyle(fontSize: 22),
                            ),
                            Text(
                              " Fashion",
                              style: TextStyle(fontSize: 22),
                            ),
                            Text(
                              " Airpods",
                              style: TextStyle(fontSize: 22),
                            ),
                          ]),
                      TableRow(
                          decoration: BoxDecoration(color: Colors.grey),
                          children: [
                            Text(
                              " Phone Accessories",
                              style: TextStyle(fontSize: 22),
                            ),
                            Text(
                              " Phone Accessories",
                              style: TextStyle(fontSize: 22),
                            ),
                            Text(
                              " Laptops",
                              style: TextStyle(fontSize: 22),
                            ),
                          ]),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
