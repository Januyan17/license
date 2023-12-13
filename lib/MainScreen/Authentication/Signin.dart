// ignore_for_file: prefer_const_constructors, unused_local_variable, sort_child_properties_last, use_build_context_synchronously, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insurancemora/Controller/Authentication/AuthController.dart';
import 'package:insurancemora/Helpers/TextStyle/Textstyle.dart';
import 'package:insurancemora/MainScreen/Authentication/Signup.dart';
import 'package:insurancemora/MainScreen/BottomNavigationBar/BottomNavigation.dart';

import '../../Controller/CommonController/CommonController.dart';
import '../../Helpers/Colors/colors.dart';
import '../../Helpers/Loader/Loader.dart';
import '../../ReusableWidgets/Authentication/Signin-Reusable.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final SigninController authcontroller = Get.put(SigninController());
  final CommonController commoncontroller = Get.put(CommonController());
  TextEditingController loginemailcontroller = TextEditingController();
  TextEditingController loginpasswordcontroller = TextEditingController();
  // bool showPassword = true;
  String? bodyError;
  @override
  void initState() {
    super.initState();
  }

  // void obscurepsw() {
  //   // controller.visiblepsw(false);
  //   print("object");
  //   // setState(() => showPassword = !showPassword);
  // }

  void navigation() {
    // commoncontroller.enableLoader(true.obs);
    Get.off(BottomNavigationScreen(pageno: 2));
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
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sign In",
                          style: authheadingstyle,
                        ),
                        SizedBox(
                          height: screenHeight * 0.01,
                        ),
                        Text(
                          "We are happy to see you here!",
                          style: authsubheadingstyle,
                        ),
                        SizedBox(
                          height: screenHeight * 0.05,
                        ),
                        Container(
                            height: screenHeight * 0.28,
                            width: screenWidth,
                            child: Image(
                                image: AssetImage("assets/images/signin.png"))),
                        SizedBox(height: screenHeight * 0.04),
                        logintextform(loginemailcontroller),
                        SizedBox(
                          height: screenHeight * 0.03,
                        ),
                        GetBuilder<SigninController>(
                          builder: (_) {
                            return textformpassword(
                              loginpasswordcontroller,
                              authcontroller.toggleVisiblePsw,
                              authcontroller.showpsw.value,
                            );
                          },
                        ),

                        SizedBox(
                          height: screenHeight * 0.000002,
                        ),
                        bodyError != null
                            ? Text(
                                bodyError.toString(),
                                style: TextStyle(color: Colors.red),
                              )
                            : SizedBox(),
                        SizedBox(
                          height: screenHeight * 0.000001,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                              onPressed: () {
                                navigation();
                              },
                              child: Text(
                                "Forgot Password ?",
                                style: authcommonnavigationtextcolor,
                              )),
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
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
                                    "Login",
                                    style: buttontextstyle,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: HexColor("#FF9E90"),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          10), // <-- Radius
                                    ),
                                  ),
                                  onPressed: () {
                                    navigation();
                                    // Get.snackbar("success", "Login Succesfully",
                                    //     snackPosition: SnackPosition.BOTTOM,
                                    //     duration: Duration(seconds: 1));
                                  },
                                ),
                              ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't Have an Account ",
                              style: authcommonnavigationtextcolor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(SignUpScreen());
                              },
                              child: Text(
                                "REGISTER",
                                style: TextStyle(
                                    color: HexColor("#FE5B44"),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        // Center(
                        //     child: Text(
                        //   "OR",
                        //   style: TextStyle(fontWeight: FontWeight.bold),
                        // )),
                        // SizedBox(
                        //   height: screenHeight * 0.001,
                        // ),
                        // Center(
                        //     child: Container(
                        //   height: screenHeight * 0.06,
                        //   width: screenWidth * 0.08,
                        //   child: GestureDetector(
                        //     onTap: () {
                        //       // _signInWithGoogle(context);
                        //     },
                        //     child: Image.asset('assets/images/google.png',
                        //         fit: BoxFit.cover),
                        //   ),
                        // ))
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
