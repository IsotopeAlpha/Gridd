// ignore_for_file: depend_on_referenced_packages, must_be_immutable

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../screens/cart.dart';
import '../utils/colors.dart';

class MyCart extends StatelessWidget {
  List cart;
  MyCart({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Cart(),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.all(2.w),
        child: Stack(
          children: [
            const Icon(
              Icons.shopping_cart,
              size: 35,
            ),
            Padding(
              padding: EdgeInsets.only(left: 3.w),
              child: CircleAvatar(
                radius: 10,
                backgroundColor: MyColors.yellowColor,
                foregroundColor: MyColors.blueColor,
                // ignore: unnecessary_null_comparison
                child: cart.isNotEmpty || cart != null
                    ? Text(cart.length.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 10.sp))
                    : Text(
                        "0",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 10.sp),
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
