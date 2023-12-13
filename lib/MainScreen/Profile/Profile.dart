// ignore_for_file: avoid_single_cascade_in_expression_statements, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:get/get.dart';
import 'package:insurancemora/Helpers/TextStyle/Textstyle.dart';
import 'package:insurancemora/ReusableWidgets/Profile/Profile-Reusable.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

import '../../Helpers/Colors/Colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController loginemailcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: primaryBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView(
          children: [
            // User card
            BigUserCard(
              backgroundColor: primarygreyDark,
              userName: "Tivinstan",
              userProfilePic: AssetImage("assets/images/person.png"),
              cardActionWidget: SettingsItem(
                icons: Icons.edit,
                iconStyle: IconStyle(
                  withBackground: true,
                  borderRadius: 50,
                  backgroundColor: Colors.yellow[600],
                ),
                title: "Modify",
                subtitle: "Tap to change your data",
                onTap: () {
                  Get.defaultDialog(
                      title: "Edit Your Profile",
                      content: Column(
                        children: [
                          profiletextform(loginemailcontroller, "Name"),
                          SizedBox(
                            height: screenHeight * 0.01,
                          ),
                          profiletextform(loginemailcontroller, "NIC"),
                          SizedBox(
                            height: screenHeight * 0.01,
                          ),
                          profiletextform(loginemailcontroller, "License No"),
                          SizedBox(
                            height: screenHeight * 0.01,
                          ),
                          profiletextform(loginemailcontroller, "License Type"),
                          SizedBox(
                            height: screenHeight * 0.01,
                          ),
                          profiletextform(loginemailcontroller, "Issue Date"),
                          SizedBox(
                            height: screenHeight * 0.01,
                          ),
                          profiletextform(loginemailcontroller, "Expiry Date"),
                          SizedBox(
                            height: screenHeight * 0.01,
                          ),
                          profiletextform(
                              loginemailcontroller, "Last renewal Date"),
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          Container(
                            height: screenHeight * 0.05,
                            width: screenWidth * 0.5,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: HexColor("#FF9E90"),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(10), // <-- Radius
                                ),
                              ),
                              onPressed: () {
                                // navigation();
                                Get.snackbar("success", "Update Succesfully",
                                    snackPosition: SnackPosition.BOTTOM,
                                    duration: Duration(seconds: 2));
                              },
                              child: Text(
                                "Update",
                                style: buttontextstyle,
                              ),
                            ),
                          ),
                        ],
                      ));
                },
              ),
            ),

            SettingsGroup(items: [
              SettingsItem(
                onTap: () {},
                icons: CupertinoIcons.house,
                iconStyle: IconStyle(),
                title: 'Medical',
                subtitle: "Find Your Date",
              ),
            ]),

            SettingsGroup(
              items: [
                SettingsItem(
                  icons: Icons.graphic_eq_sharp,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    backgroundColor: Colors.red,
                  ),
                  title: 'Tax Reminder',
                ),
              ],
            ),
            SettingsGroup(
              items: [
                SettingsItem(
                  icons: Icons.language,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    backgroundColor: Colors.green,
                  ),
                  title: 'Insurance Reminder ',
                ),
              ],
            ),
            SettingsGroup(
              settingsGroupTitle: "Account",
              items: [
                SettingsItem(
                  onTap: () {
                    signOutUser();
                  },
                  icons: Icons.exit_to_app_rounded,
                  title: "Sign Out",
                  titleStyle: TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SettingsItem(
                  onTap: () {},
                  icons: CupertinoIcons.star_circle_fill,
                  title: "Upgrade to Premium",
                  titleStyle: TextStyle(
                    color: primarygreyLight,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      // Here, default theme colors are used for activeBgColor, activeFgColor, inactiveBgColor and inactiveFgColor
    );
  }

  Future<void> signOutUser() async {
    PanaraConfirmDialog.showAnimatedGrow(
      context,
      title: "Are You Sure",
      message: "SignOut From App",
      confirmButtonText: "Confirm",
      cancelButtonText: "Cancel",
      color: Colors.red,
      onTapCancel: () {
        Navigator.pop(context);
      },
      onTapConfirm: () async {},
      panaraDialogType: PanaraDialogType.success,
      barrierDismissible: false, // optional parameter (default is true)
    );
  }
}
