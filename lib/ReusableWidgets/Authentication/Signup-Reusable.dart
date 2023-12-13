// ignore_for_file: prefer_const_constructors
import 'package:dob_input_field/dob_input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/Authentication/AuthController.dart';
import '../../Helpers/Colors/colors.dart';

Widget signuptextform(controller, hint, suficon) {
  return TextFormField(
    controller: controller,
    validator: (value) {
      if (value!.isEmpty) {
        return 'User Name required';
      }
      return null;
    },
    decoration: InputDecoration(
      filled: true,
      fillColor: textfieldinnercolor,
      hintText: hint,
      hintStyle:
          TextStyle(color: textfieldtextcolor, fontFamily: "poppinsregular"),
      suffixIcon: Icon(
        suficon,
        color: textfieldiconcolor,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 2.0,
        ),
      ),
    ),
    keyboardType: TextInputType.text,
    style: TextStyle(
      fontFamily: "Poppins",
    ),
  );
}

Widget signuptextformpassword(controller, suffixfunction, showpsw, hint) {
  return TextFormField(
    style: TextStyle(fontSize: 16.0, color: primaryblackColor),
    // cursorColor: kPrimaryPurpleColor,
    keyboardType: TextInputType.text,
    obscureText: showpsw,
    validator: (value) {
      RegExp regex = RegExp(
          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
      if (value!.isEmpty) {
        return 'Password required';
      }
      // else if (!regex.hasMatch(value)) {
      //   return 'Password Must contains \n - Minimum 1 Upper case \n - Minimum 1 lowercase \n - Minimum 1 Number \n - Minimum 1 Special Character \n - Minimum 8 letters';
      // }
      return null;
    },
    // onSaved: (String? val) {
    //   password = val;
    // },
    controller: controller,
    textInputAction: TextInputAction.done,
    decoration: InputDecoration(
      filled: true,
      fillColor: textfieldinnercolor,
      suffixIcon: IconButton(
        onPressed: () {
          suffixfunction();
        },
        icon: Icon(
          showpsw ? Icons.visibility_off : Icons.visibility,
          color: textfieldiconcolor,
        ),
      ),
      hintText: hint,
      hintStyle:
          TextStyle(color: textfieldtextcolor, fontFamily: "poppinsregular"),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 2.0,
        ),
      ),
    ),
  );
}

class CustomDropdownGender extends StatelessWidget {
  final SigninController authcontroller = Get.put(SigninController());
  CustomDropdownGender({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.grey[200], // Change this to your desired color
      ),
      child: GetBuilder<SigninController>(
        builder: (_) => DropdownButton<String>(
          value: authcontroller.selectedValueGender.value,
          items: const [
            DropdownMenuItem(value: 'Male', child: Text('Male')),
            DropdownMenuItem(value: 'Female', child: Text('Female')),
            DropdownMenuItem(value: 'Transgender', child: Text('Transgender')),
          ],
          onChanged: (value) {
            authcontroller.setSelectedValue(value!);
          },
          hint: Text('Select an option'),
          isExpanded: true,
        ),
      ),
    );
  }
}

class CustomDropdownProvince extends StatelessWidget {
  final SigninController authcontroller = Get.put(SigninController());
  CustomDropdownProvince({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.grey[200], // Change this to your desired color
      ),
      child: GetBuilder<SigninController>(
        builder: (_) => DropdownButton<String>(
          value: authcontroller.selectedValueProvince.value,
          items: const [
            DropdownMenuItem(value: 'Northern', child: Text('Northern')),
            DropdownMenuItem(
                value: 'North Western	', child: Text('North Western	')),
            DropdownMenuItem(value: 'Western', child: Text('Western')),
            DropdownMenuItem(
                value: 'North Central	', child: Text('North Central	')),
            DropdownMenuItem(value: 'Central', child: Text('Central')),
            DropdownMenuItem(
                value: 'Sabaragamuwa', child: Text('Sabaragamuwa')),
            DropdownMenuItem(value: 'Eastern', child: Text('Eastern')),
            DropdownMenuItem(value: 'Uva', child: Text('Uva')),
            DropdownMenuItem(value: 'Southern', child: Text('Southern')),
          ],
          onChanged: (value) {
            authcontroller.setSelectedValueProvince(value!);
          },
          hint: Text('Select an option'),
          isExpanded: true,
        ),
      ),
    );
  }
}

class CustomDropdownDistrict extends StatelessWidget {
  final SigninController authcontroller = Get.put(SigninController());
  CustomDropdownDistrict({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.grey[200], // Change this to your desired color
      ),
      child: GetBuilder<SigninController>(
        builder: (_) => DropdownButton<String>(
          value: authcontroller.selectedValueSDistrict.value,
          items: const [
            DropdownMenuItem(value: 'Jaffna', child: Text('Jaffna')),
            DropdownMenuItem(value: 'Kilinochchi', child: Text('Kilinochchi')),
            DropdownMenuItem(value: 'Mannar', child: Text('Mannar')),
            DropdownMenuItem(value: 'Mullaitivu	', child: Text('Mullaitivu')),
            DropdownMenuItem(value: 'Vavuniya', child: Text('Vavuniya')),
            DropdownMenuItem(value: 'Puttalam', child: Text('Puttalam')),
            DropdownMenuItem(value: 'Kurunegala', child: Text('Kurunegala')),
            DropdownMenuItem(value: 'Gampaha', child: Text('Gampaha')),
            DropdownMenuItem(value: 'Colombo', child: Text('Colombo')),
            DropdownMenuItem(value: 'Kalutara', child: Text('Kalutara')),
            DropdownMenuItem(
                value: 'Anuradhapura', child: Text(' Anuradhapura	')),
            DropdownMenuItem(value: 'Polonnaruwa', child: Text('Polonnaruwa')),
            DropdownMenuItem(value: 'Matale	', child: Text(' Matale	')),
            DropdownMenuItem(value: 'Kandy', child: Text('Kandy')),
            DropdownMenuItem(
                value: 'Nuwara Eliya', child: Text('Nuwara Eliya')),
            DropdownMenuItem(value: 'Kegalle', child: Text('Kegalle')),
            DropdownMenuItem(value: 'Ratnapura', child: Text('Ratnapura')),
            DropdownMenuItem(value: 'Trincomalee', child: Text('Trincomalee')),
            DropdownMenuItem(value: 'Batticaloa', child: Text('Batticaloa')),
            DropdownMenuItem(value: 'Ampara	', child: Text('Ampara')),
            DropdownMenuItem(value: 'Badulla', child: Text('Badulla')),
            DropdownMenuItem(value: 'Monaragala', child: Text('Monaragala')),
            DropdownMenuItem(value: 'Hambantota', child: Text('Hambantota')),
            DropdownMenuItem(value: 'Matara', child: Text('Matara')),
            DropdownMenuItem(value: 'Galle', child: Text('Galle')),
          ],
          onChanged: (value) {
            authcontroller.setSelectedValueDistrict(value!);
          },
          hint: Text('Select an option'),
          isExpanded: true,
        ),
      ),
    );
  }
}

class CustomDropdownDOB extends StatelessWidget {
  final SigninController authcontroller = Get.put(SigninController());
  CustomDropdownDOB({super.key});
  @override
  Widget build(BuildContext context) {
    return DOBInputField(
      inputDecoration: InputDecoration(
        filled: true,
        fillColor: textfieldinnercolor,
        hintStyle: TextStyle(
          color: textfieldtextcolor,
          fontFamily: "poppinsregular",
        ),
        suffixIcon: Icon(
          Icons.safety_check,
          color: textfieldiconcolor,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 2.0,
          ),
        ),
        border: InputBorder.none, // Remove underline in autovalidation
      ),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      showLabel: true,
      showCursor: true,
      autovalidateMode: AutovalidateMode.always,
      onDateSubmitted: (value) {
        authcontroller.setSelectedValueDOB(value);
      },
    );
  }
}

// Widget DOBField(DateTime date) {
//   return DOBInputField(
//     inputDecoration: InputDecoration(
//       filled: true,
//       fillColor: textfieldinnercolor,
//       hintStyle: TextStyle(
//         color: textfieldtextcolor,
//         fontFamily: "poppinsregular",
//       ),
//       suffixIcon: Icon(
//         Icons.safety_check,
//         color: textfieldiconcolor,
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(15.0),
//         borderSide: BorderSide(
//           color: Colors.transparent,
//         ),
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(15.0),
//         borderSide: BorderSide(
//           color: Colors.transparent,
//           width: 2.0,
//         ),
//       ),
//       border: InputBorder.none, // Remove underline in autovalidation
//     ),
//     firstDate: DateTime(1900),
//     lastDate: DateTime.now(),
//     showLabel: true,
//     showCursor: true,
//     autovalidateMode: AutovalidateMode.always,
//     onDateSubmitted: (date) {
//       // Handle the submitted date here
//       print('Selected date: $date');
//       // You can perform any additional actions or validations as needed
//     },
//   );
// }