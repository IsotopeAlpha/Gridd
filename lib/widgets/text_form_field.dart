// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  String? label, hint;
  Icon? icon;
  bool? obscure;
  String Function(String?)? validator, onSaved;
  TextInputType? inputType;

  MyTextFormField(
      {Key? key,
      this.label,
      this.hint,
      this.icon,
      this.validator,
      this.onSaved,
      this.obscure,
      this.inputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure ?? false,
      onSaved: onSaved,
      validator: validator,
      keyboardType: inputType,
      decoration: InputDecoration(
        label: Text(label!),
        helperText: "Required",
        hintText: hint,
        prefixIcon: icon,
        //suffixIcon: obscure == null
        // ? null
        // : obscure == true
        //     ? GestureDetector(
        //         child: Icon(Icons.visibility),
        //         onTap: () {
        //           setState(() {
        //             obscure = false;
        //           });
        //         },
        //       )
        //     : GestureDetector(
        //         child: Icon(Icons.visibility_off),
        //         onTap: () {
        //           setState(() {
        //             obscure = true;
        //           });
        //         },
        //       ),
      ),
    );
  }
}
