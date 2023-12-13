// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:insurancemora/Helpers/Colors/Colors.dart';
import 'package:insurancemora/MainScreen/HomeScreen/HomeScreen.dart';
import 'package:insurancemora/MainScreen/LicenseRenewal/LicenseRenewal.dart';
import 'package:insurancemora/MainScreen/Profile/Profile.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../MedicalAppointment/MedicalAppointment.dart';

class BottomNavigationScreen extends StatefulWidget {
  final int pageno;
  const BottomNavigationScreen({super.key, required this.pageno});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int maxCount = 4;
  late StreamSubscription _subscription;
  String netstatus = '';
  final int _currentPage = 0;
  final _pageController = PageController(initialPage: 0);

  Widget? _child;
  var _currentIndex = 0;
  @override
  void initState() {
    _currentIndex = widget.pageno;
    super.initState();
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  final List<Widget> _screens = [
    LicenseRenewal(),
    MedicalAppointment(),
    HomeScreen(),
    // Notifications(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0.0;
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        curve: Curves.linear,
        backgroundColor: HexColor("#FF9E90"),
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.class_),
            title: Text("License"),
            selectedColor: Colors.redAccent.shade700,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.cabin),
            title: Text("Medical"),
            selectedColor: Colors.redAccent.shade700,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.home_filled),
            title: Text("Home"),
            selectedColor: Colors.redAccent.shade700,
          ),
          // SalomonBottomBarItem(
          //   icon: Icon(Icons.notifications),
          //   title: Text("Notification"),
          //   selectedColor: Colors.redAccent.shade700,
          // ),
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
            selectedColor: Colors.redAccent.shade700,
          ),
        ],
      ),
    );
  }
}
