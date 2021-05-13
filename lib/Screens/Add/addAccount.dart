import 'package:flutter/material.dart';
class AddAccount extends StatefulWidget {
  AddAccount({Key key}) : super(key: key);

  @override
  _AddAccountState createState() => _AddAccountState();
}

class _AddAccountState extends State<AddAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack( 
        children: [
          Image.asset("assets/images/background.png")
        ],
        ),
      ),
      appBar: AppBar(
        
      ),
    );
  }
}