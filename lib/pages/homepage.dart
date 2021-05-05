import 'package:flutter/material.dart';
import 'package:debtors/main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Debtors'),
        backgroundColor: Colors.lightBlue[600],
      ),
      body: Container(
        child: Center(
        child: Text('Login'),
      ),
      ),
    );
  }
}