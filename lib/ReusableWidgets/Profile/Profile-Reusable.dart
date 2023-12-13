import 'package:flutter/material.dart';

import '../../Helpers/Colors/colors.dart';

Widget profiletextform(controller, hint) {
  return TextFormField(
    controller: controller,
    validator: (value) {
      if (value!.isEmpty) {
        return 'User Name required';
      }
      // else if (!regex.hasMatch(value)) {
      //   return 'Password Must contains \n - Minimum 1 Upper case \n - Minimum 1 lowercase \n - Minimum 1 Number \n - Minimum 1 Special Character \n - Minimum 8 letters';
      // }
      return null;
    },
    decoration: InputDecoration(
      filled: true,
      fillColor: textfieldinnercolor,
      hintText: hint,
      hintStyle:
          TextStyle(color: textfieldtextcolor, fontFamily: "poppinsregular"),
      // suffixIcon: Icon(
      //   Icons.email,
      //   color: textfieldiconcolor,
      // ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: const BorderSide(
          color: primarywhitecolor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: const BorderSide(
          color: primarywhitecolor,
          width: 2.0,
        ),
      ),
    ),
    keyboardType: TextInputType.text,
    style: const TextStyle(
      fontFamily: "Poppins",
    ),
  );
}
