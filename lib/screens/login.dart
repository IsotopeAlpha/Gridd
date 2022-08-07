// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:just_app/screens/home.dart';
import 'package:just_app/screens/sign-up-page.dart';
import 'package:just_app/widgets/text_form_field.dart';
import 'package:sizer/sizer.dart';

import '../utils/colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.whiteColor,
        body: Column(
          children: [
            Container(
              height: 20.h,
              width: 100.w,
              alignment: Alignment.center,
              child: Text(
                'Login',
                style: TextStyle(
                    fontFamily: 'Lobster',
                    fontSize: 30.sp,
                    color: MyColors.primaryColor,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              color: Colors.grey[100],
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(
                horizontal: 10.w,
              ),
              padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 5.w),
              child: Center(
                child: Column(
                  children: [
                    MyTextFormField(
                      label: "Phone",
                      icon: const Icon(Icons.phone),
                      inputType: TextInputType.phone,
                    ),
                    MyTextFormField(
                      obscure: true,
                      label: "Password",
                      icon: const Icon(Icons.lock),
                      inputType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontFamily: 'Lobster',
                            fontSize: 12.sp,
                          ),
                        ))
                  ],
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterPage()));
                },
                child: const Text("No Account? Register."))
          ],
        ));
  }
}
