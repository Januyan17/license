// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insurancemora/Controller/Home/HomeController.dart';
import 'package:insurancemora/Helpers/Colors/Colors.dart';

class HomeCard extends StatelessWidget {
  final String name;
  final String nic;
  final String licenseno;
  final String licensetype;
  final String issuedate;
  final String expirydate;
  final String lastrenewdate;

  const HomeCard(
      {super.key,
      required this.name,
      required this.nic,
      required this.licenseno,
      required this.licensetype,
      required this.issuedate,
      required this.expirydate,
      required this.lastrenewdate});

  @override
  Widget build(
    BuildContext context,
  ) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(18.0), // Adjust the radius as needed
      ),
      color: HexColor("#fff6f0"),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage(
                  'assets/images/person.png'), // Replace with your image asset
            ),
            const SizedBox(height: 16.0),
            TextFieldContainer(
              child: TextField(
                enableInteractiveSelection: false,
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                decoration: InputDecoration(
                  labelText: name,
                  border: InputBorder.none,
                ),
              ),
            ),
            TextFieldContainer(
              child: TextField(
                enableInteractiveSelection: false,
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                decoration: InputDecoration(
                  labelText: nic,
                  border: InputBorder.none,
                ),
              ),
            ),
            TextFieldContainer(
              child: TextField(
                enableInteractiveSelection: false,
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                decoration: InputDecoration(
                  labelText: licenseno,
                  border: InputBorder.none,
                ),
              ),
            ),
            TextFieldContainer(
              child: TextField(
                enableInteractiveSelection: false,
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                decoration: InputDecoration(
                  labelText: licensetype,
                  border: InputBorder.none,
                ),
              ),
            ),
            TextFieldContainer(
              child: TextField(
                enableInteractiveSelection: false,
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                decoration: InputDecoration(
                  labelText: issuedate,
                  border: InputBorder.none,
                ),
              ),
            ),
            TextFieldContainer(
              child: TextField(
                enableInteractiveSelection: false,
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                decoration: InputDecoration(
                  labelText: expirydate,
                  border: InputBorder.none,
                ),
              ),
            ),
            TextFieldContainer(
              child: TextField(
                enableInteractiveSelection: false,
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                decoration: InputDecoration(
                  labelText: lastrenewdate,
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;

  const TextFieldContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: child,
    );
  }
}

class CustomDropdownMedicalCentre extends StatelessWidget {
  final HomeController homecontroller = Get.put(HomeController());
  CustomDropdownMedicalCentre({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.grey[200], // Change this to your desired color
      ),
      child: GetBuilder<HomeController>(
        builder: (_) => DropdownButton<String>(
          value: homecontroller.selectedValuemedicalcentre.value,
          items: const [
            DropdownMenuItem(value: 'Jaffna', child: Text('Jaffna')),
            DropdownMenuItem(value: 'Kilinochi', child: Text('Kilinochi')),
            DropdownMenuItem(value: 'Vavuniya', child: Text('Vavuniya')),
          ],
          onChanged: (value) {
            homecontroller.selectedValuemedicalcentre(value!);
          },
          hint: Text('Select an option'),
          isExpanded: true,
        ),
      ),
    );
  }
}
