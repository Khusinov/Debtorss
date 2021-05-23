import 'package:debtors/AuthenticationServise/AuthenticationServise.dart';
import 'package:flutter/material.dart';
import 'package:debtors/Screens/Login/components/background.dart';
import 'package:debtors/companents/rounded_button.dart';
import 'package:provider/provider.dart';


class Body extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.00001),
            Image.asset(
              "assets/images/debtorsBlue.png",
              height: size.height * 0.25,
            ),

            SizedBox(height: size.height * 0.03),

            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: "Password",
              ),
            ),
            RaisedButton(
              onPressed: () {
                context.read<AuthenticationService>().signIn(
                  email: emailController.text.trim(),
                  password: passwordController.text.trim(),
                );
              },
              child: Text("Sign in"),
            )
            // RoundedButton(
            //   text: "KIRISH",
            //   press: () {
            //     print('button bosildi');
            //     context.read<AuthenticationService>().signIn(
            //         email:  emailController.text.trim(),
            //         password: passwordController.text.trim(),
            //         );
            //     // Navigator.push(
            //     //   context,
            //     //   MaterialPageRoute(builder: (context) => ListScreen()),
            //     // );
            //    // AuthenticationWrapper();
            //   },
            // ),
           // SizedBox(height: size.height * 0.03),
          ],
        ),
      ),
    );
  }
}
