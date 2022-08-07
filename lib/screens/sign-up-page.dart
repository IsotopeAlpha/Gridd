// ignore_for_file: depend_on_referenced_packages, file_names

import 'package:flutter/material.dart';
import 'package:just_app/screens/login.dart';
import 'package:just_app/widgets/text_form_field.dart';
import 'package:sizer/sizer.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../utils/colors.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List user = [];
    final formKey = GlobalKey<FormState>();
    String name, phone, password;

    return Scaffold(
        backgroundColor: MyColors.whiteColor,
        body: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 20.h,
                  width: 85.w,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 15.w),
                  child: Text(
                    'Register',
                    style: TextStyle(
                        fontFamily: 'Lobster',
                        fontSize: 30.sp,
                        color: MyColors.primaryColor,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const CircleAvatar(
                      backgroundColor: MyColors.primaryColor,
                      child: Icon(
                        Icons.close,
                        color: MyColors.whiteColor,
                      )),
                ),
              ],
            ),
            Container(
              color: Colors.grey[100],
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(
                horizontal: 10.w,
              ),
              padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 5.w),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    MyTextFormField(
                      onSaved: (value) {
                        return name = value!;
                      },
                      label: "Full Name",
                      icon: const Icon(Icons.person),
                      inputType: TextInputType.text,
                    ),
                    MyTextFormField(
                      onSaved: (value) {
                        return phone = value!;
                      },
                      label: "Phone",
                      icon: const Icon(Icons.phone),
                      inputType: TextInputType.phone,
                    ),
                    MyTextFormField(
                      onSaved: (value) {
                        return password = value!;
                      },
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
                        formKey.currentState!.save();

                        Hive.box('UserDetails').put('user', user);
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontFamily: 'Lobster',
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
                child: const Text("Already Registered? Login."))
          ],
        ));
  }
}
