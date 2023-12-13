import 'package:flutter/material.dart';

class MedicalAppointment extends StatefulWidget {
  const MedicalAppointment({super.key});

  @override
  State<MedicalAppointment> createState() => _MedicalAppointmentState();
}

class _MedicalAppointmentState extends State<MedicalAppointment> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Center(
        child: Text("Under Development"),
      )),
    );
  }
}
