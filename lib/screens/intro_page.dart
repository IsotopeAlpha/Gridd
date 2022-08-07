// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:just_app/screens/login.dart';
import 'package:just_app/utils/colors.dart';
import 'package:sizer/sizer.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: Center(
          child: Stack(children: [
            Positioned(
              top: 5.h,
              left: 1.w,
              child: Image.asset(
                "assets/images/fashion/shirt.jpeg",
                width: 40.w,
                height: 50.h,
              ),
            ),
            Positioned(
              top: 45.h,
              right: 1.w,
              child: Image.asset(
                "assets/images/phones/iPhone7Plus.jpg",
                width: 40.w,
                height: 50.h,
              ),
            ),
            Positioned(
              left: 15.w,
              top: 35.h,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.w),
                  color: MyColors.primaryColor,
                ),
                width: 70.w,
                height: 30.h,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  },
                  child: Text(
                    "Get Started",
                    style:
                        TextStyle(color: MyColors.whiteColor, fontSize: 15.sp),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10.h,
              right: 1.w,
              child: Image.asset(
                "assets/images/fashion/short.jpg",
                width: 40.w,
                height: 50.h,
              ),
            ),
            Positioned(
              top: 45.h,
              left: 5.w,
              child: Image.asset(
                "assets/images/fashion/air2.jpeg",
                width: 40.w,
                height: 50.h,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
