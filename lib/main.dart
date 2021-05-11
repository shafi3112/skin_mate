import 'package:flutter/material.dart';
import 'package:skin_mate/AppointmentScreens/family_Setup_Profile/family_Members.dart';
import 'package:skin_mate/Screens/WelcomeScreen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: family_Members(),
    );
  }
}

