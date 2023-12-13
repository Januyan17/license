// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insurancemora/Helpers/Colors/Colors.dart';
import 'package:insurancemora/Helpers/TextStyle/Textstyle.dart';
import 'package:insurancemora/ReusableWidgets/Home/Home-Reusable.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _dateController;
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    _dateController = TextEditingController();
    selectedDate = DateTime.now(); // Set an initial date if needed
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _dateController.text = "${selectedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: primaryBackgroundColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: HomeCard(
                name: 'Tivinstan',
                nic: '200033399453',
                licenseno: '2346',
                licensetype: 'Normal',
                issuedate: '27/10/2022',
                expirydate: '27/10/2030',
                lastrenewdate: '27/10/2022',
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: screenHeight * 0.07,
              width: screenWidth * 0.9,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: HexColor("#ffb199"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // <-- Radius
                  ),
                ),
                onPressed: () {
                  Get.defaultDialog(
                      title: "Renew Medical",
                      content: Column(
                        children: [
                          TextField(
                            controller: _dateController,
                            enableInteractiveSelection: false,
                            onTap: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                              _selectDate(context);
                            },
                            decoration: InputDecoration(
                              labelText: 'Selected Date',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          CustomDropdownMedicalCentre(),
                          SizedBox(
                            height: 30,
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
                                Get.snackbar("success", "Confirm Succesfully",
                                    snackPosition: SnackPosition.BOTTOM,
                                    duration: Duration(seconds: 2));
                              },
                              child: Text(
                                "Confirm",
                                style: buttontextstyle,
                              ),
                            ),
                          ),
                        ],
                      ));
                },
                child: Text(
                  "Renew",
                  style: buttontextstyle,
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
