// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:just_app/utils/colors.dart';

class BackButton extends StatelessWidget {
  Function()? backAction;

  BackButton({Key? key, this.backAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const CircleAvatar(
        radius: 10,
        backgroundColor: MyColors.yellowColor,
        foregroundColor: MyColors.primaryColor,
        child: Icon(
          Icons.arrow_back,
        ),
      ),
      onPressed: () {
        backAction != null ? backAction!() : Navigator.pop(context);
      },
    );
  }
}
