// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../screens/details.dart';

// ignore: must_be_immutable
class Featured extends StatelessWidget {
  String title;
  Function() onViewTap;
  List item, cart;

  Featured(
      {Key? key,
      required this.title,
      required this.onViewTap,
      required this.item,
      required this.cart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Container(
              width: 100.w,
              padding: const EdgeInsets.all(4),
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontFamily: 'Lobster',
                        fontSize: 14.sp,
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    child: const Text(
                      'View All',
                      style: TextStyle(
                          fontFamily: 'Lobster',
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      onViewTap();
                    },
                  ),
                ],
              )),
          SizedBox(
            width: 100.w,
            height: 30.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(5),
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  child: SizedBox(
                    width: 40.w,
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  item[index].img,
                                  width: 35.w,
                                  height: 20.h,
                                ),
                                Center(
                                  child: Text(item[index].name),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            right: 5,
                            child: Container(
                              color: Colors.black,
                              padding: const EdgeInsets.all(5),
                              child: Text(
                                'GHs ${item[index].price}',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailsPage(item: item[index])));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
