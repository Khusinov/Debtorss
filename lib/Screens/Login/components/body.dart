import 'package:flutter/material.dart';
import 'package:debtors/Screens/Login/components/background.dart';
import 'package:debtors/companents/rounded_button.dart';
import 'package:debtors/companents/rounded_input_field.dart';
import 'package:debtors/companents/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           
           SizedBox(height: size.height*0.00001),
            Image.asset(
              "assets/images/debtorsBlue.png",
              height: size.height * 0.25,

            ),
            //  Text(
            //   "KIRISH",
            //   style: TextStyle(
            //     fontWeight: FontWeight.bold,
            //     fontSize: 20,
            //     color: Colors.blueAccent,
            //     ),
            // ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Nomer:",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "KIRISH",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
          
          ],
        ),
      ),
    );
  }
}
