import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:debtors/AuthenticationServise/AuthenticationServise.dart';
import 'package:debtors/DatabaseManager.dart';
import 'package:debtors/Screens/Add/addAccount.dart';
import 'package:flutter/material.dart';
import 'package:debtors/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:debtors/Screens/Details/details.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  TextEditingController _nameController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _scoreController = TextEditingController();

  List userProfilesList = [];

  String userID = "";

  @override
  void initState() {
    super.initState();
   // fetchUserInfo();
    fetchDatabaseList();
  }
  //
  // fetchUserInfo() async {
  //   FirebaseUser getUser = await FirebaseAuth.instance.currentUser();
  //   userID = getUser.uid;
  // }

  fetchDatabaseList() async {
    dynamic resultant = await DatabaseManager().getUsersData();

    if (resultant == null) {
      print('Unable to retrieve');
    } else {
      setState(() {
       // Map<String, dynamic> data = resultant;
        userProfilesList = resultant;
        print(userProfilesList.toString());
       // print(data[1]['name']);
       // print("USERPROFILESLIST[1]:  ${userProfilesList[] }");
      });
    }
  }

  ListView buildListView(BuildContext context) {
    // print(" mytag ${userProfilesList[0].toList().toString()}");
    return ListView.builder(
      itemCount: userProfilesList.length,
      itemBuilder: (context , index) {
        return GestureDetector(
          onTap: () => {
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(29),
              child: Container(
                color: kPrimaryLightColor,
                child: ListTile(
                  title: Text(
                    '${index + 1}. ${ userProfilesList[index]['name']} ',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                    ),

                  ),
                  subtitle: Text(
                    '${userProfilesList[index]['summa']}  ${userProfilesList[index]['date']}',
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward,
                    size: 30,
                    color: Colors.blue,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailPage(index)),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddAccount()));
        },
        child: Icon(
          Icons.add_circle_rounded,
          size: 40,
        ),
      ),
      body: Container(
        child: Stack(
          children: [
            Image.asset("assets/images/background.png"),
            buildListView(context),
          ],
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {

          },
          icon: Icon(
            Icons.account_circle_outlined,
            color: Colors.white,
            size: 35,
          ),
        ),
        backgroundColor: kPrimaryColor,
        titleSpacing: 20,
        actions: <Widget>[
          IconButton(
            onPressed: () {

              } ,
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: 28,
            ),
          ),
          IconButton(
            onPressed: () {
              print('Log Out button ');
              context.read<AuthenticationService>().signOut();
            },
            icon: Icon(
              Icons.logout,
              color: Colors.white,
              size: 28,
            ),
          ),
        ],
        title: Text(
          'Qarzdorlar ro\'yxati',
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
