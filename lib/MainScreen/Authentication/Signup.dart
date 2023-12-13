// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, prefer_final_fields, sized_box_for_whitespace, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insurancemora/Controller/Authentication/AuthController.dart';
import 'package:insurancemora/Controller/CommonController/CommonController.dart';
import 'package:insurancemora/Helpers/Loader/Loader.dart';
import 'package:insurancemora/Helpers/TextStyle/Textstyle.dart';
import 'package:insurancemora/MainScreen/Authentication/Signin.dart';
import '../../Helpers/Colors/colors.dart';
import '../../Helpers/Texts/Validation.dart';
import '../../ReusableWidgets/Authentication/Signup-Reusable.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? bodyError;
  final regex = RegExp(Emailpattern);
  final SigninController authcontroller = Get.put(SigninController());
  final CommonController commoncontroller = Get.put(CommonController());
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController conformpasswordcontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  void genderdropdown() {
    print(authcontroller.selectedValueGender.value);
    print(authcontroller.selectedValueProvince.value);
    print(authcontroller.selectedValueSDistrict.value);
    print(authcontroller.selectedDate.value);
    print("ksxaskcaskcnsac");
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: primaryBackgroundColor,
      body: SafeArea(
        child: GetBuilder<CommonController>(
          builder: (_) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Create Your ",
                              style: TextStyle(
                                  fontSize: 20, color: primarygreyDark),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Account ",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: primarygreyDark,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        Text(
                          "We are happy to see you here! ",
                          style:
                              TextStyle(fontSize: 13, color: primarygreyLight),
                        ),
                        SizedBox(
                          height: screenHeight * 0.04,
                        ),
                        Container(
                            height: screenHeight * 0.2,
                            width: screenWidth,
                            child: Image(
                                image: AssetImage("assets/images/signin.png"))),
                        signuptextform(
                            namecontroller, "First Name", Icons.person),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        signuptextform(
                            namecontroller, "Last Name", Icons.person),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        signuptextform(namecontroller, "Address", Icons.home),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        signuptextform(emailcontroller, "Email", Icons.email),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        // signupTextFormWithDropdown(
                        //     namecontroller, "Gender", Icons.pin_drop),
                        CustomDropdownGender(),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        CustomDropdownProvince(),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        CustomDropdownDistrict(),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        CustomDropdownDOB(),

                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        signuptextform(
                            emailcontroller, "NIC", Icons.perm_identity),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        GetBuilder<SigninController>(
                          builder: (_) {
                            return Column(
                              children: [
                                signuptextformpassword(
                                    passwordcontroller,
                                    authcontroller.toggleVisiblePsw,
                                    authcontroller.showpsw.value,
                                    "Password"),
                                SizedBox(
                                  height: screenHeight * 0.02,
                                ),
                                signuptextformpassword(
                                    conformpasswordcontroller,
                                    authcontroller.toggleVisiblePsw,
                                    authcontroller.showpsw.value,
                                    "Confirm Password"),
                              ],
                            );
                          },
                        ),

                        SizedBox(
                          height: screenHeight * 0.01,
                        ),
                        bodyError != null
                            ? Text(
                                bodyError.toString(),
                                style: TextStyle(color: Colors.red),
                              )
                            : SizedBox(),
                        SizedBox(
                          height: screenHeight * 0.04,
                        ),
                        commoncontroller.isLoading.value
                            ? loader
                            : Container(
                                height: screenHeight * 0.07,
                                width: screenWidth * 0.9,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: ElevatedButton(
                                  child: Text(
                                    "Register",
                                    style: buttontextstyle,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: HexColor("#FF9E90"),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onPressed: () {
                                    genderdropdown();
                                  },
                                ),
                              ),
                        SizedBox(
                          height: screenHeight * 0.03,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already Have an Account"),
                            SizedBox(
                              width: 7,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        LoginScreen()));
                              },
                              child: Text(
                                "LOGIN",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: HexColor("#FE5B44")),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
