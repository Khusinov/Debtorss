import 'package:debtors/AuthenticationServise/AuthenticationServise.dart';
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
  ListView buildListView(BuildContext context) {
    return ListView.builder(
      itemCount: 50,
      itemBuilder: (_, index) {
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
                    '${index + 1}. Asadbek Bekchanov',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                    ),

                  ),
                  subtitle: Text(
                    '320 000 so\'m  27.06.2021',
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
