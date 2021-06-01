import 'package:debtors/AuthenticationServise/AuthenticationServise.dart';
import 'package:debtors/Screens/Home/HomePage.dart';
import 'package:debtors/Screens/List/list_screen.dart';
import 'package:debtors/Screens/Login/components/body.dart';
import 'package:debtors/Screens/Login/login_screen.dart';
import 'package:debtors/Screens/SignIn/SignInPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();


    if (firebaseUser != null) {
      print("home page");
      return ListScreen();

    } else {
      print('SingInPage') ;
      return SignInPage();
    }
  }
}
