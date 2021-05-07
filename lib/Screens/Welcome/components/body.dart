import 'dart:async';

import 'package:debtors/Screens/Login/login_screen.dart';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => LoginScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    var image =Image.asset(
              'assets/images/deptors2.png',
              height: 140,
            );
    return Scaffold(
      backgroundColor: Color(0xff6CA3FD),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image,
            SizedBox(
             height: 20,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
