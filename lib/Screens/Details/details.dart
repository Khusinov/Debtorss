import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:debtors/AddDate/AddData.dart';
import 'package:debtors/DatabaseManager.dart';
import 'package:debtors/Screens/List/components/body.dart';
import 'package:debtors/Screens/List/list_screen.dart';
import 'package:debtors/companents/rounded_button.dart';
import 'package:debtors/companents/text_field_container.dart';
import 'package:debtors/styles/styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:debtors/Screens/Details/date.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatefulWidget {
  DetailPage(this.index);

  final int index;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List userProfilesList = [];
  TextEditingController summaController = TextEditingController();

  String userID = "";

  @override
  void initState() {
    super.initState();
    fetchDatabaseList();
  }

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

  final firestoreInstance = FirebaseFirestore.instance;

String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Qarz qo\'shish',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFieldContainer(
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      width: double.infinity,
                      height: 30,
                      child: Center(
                        child: Text(
                          "${widget.index + 1}. ${userProfilesList[widget.index]['name']}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  TextFieldContainer(
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      width: double.infinity,
                      height: 30,
                      child: Center(
                        child: Text(
                          "${userProfilesList[widget.index]['phone']}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  TextFieldContainer(
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      width: double.infinity,
                      height: 30,
                      child: Center(
                        child: Text(
                          "${userProfilesList[widget.index]['summa']}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                TextFieldContainer(
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      width: double.infinity,
                      height: 30,
                      child: Center(
                        child: Text(
                          'Sana: ${userProfilesList[widget.index]['date']}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  TextFormField(
                      keyboardType: TextInputType.number,
                      controller: summaController,
                      decoration: InputDecoration(
                        labelText: "Pul miqdori",
                        border: Styles.borderRounded,
                      )),
                  // TextFieldContainer(
                  //   child: Container(
                  //       padding: const EdgeInsets.all(10.0),
                  //       child: new Column(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: <Widget>[
                  //           new TextField(
                  //             decoration: new InputDecoration(
                  //                 labelText: "Pul miqdorini kiriting"),
                  //             keyboardType: TextInputType.number,
                  //             inputFormatters: <TextInputFormatter>[
                  //               FilteringTextInputFormatter.digitsOnly
                  //             ], // Only numbers can be entered
                  //           ),
                  //         ],
                  //       )),
                  // ),
                  RoundedButton(
                    text: "Qo\'shish",
                    press: () {
                      print("Qo'shish Button bosildi") ;
                      var myDouble = double.parse(summaController.text);
                      assert(myDouble is double);
                      var myDouble2 = double.parse(userProfilesList[widget.index]['summa'].toString());
                      assert(myDouble2 is double);
                      double summa1 = myDouble2 + myDouble ;
                      print(myDouble2);
                      var firebaseUser =  FirebaseAuth.instance.currentUser;
                      print(firebaseUser.uid);
                      firestoreInstance.collection("debtor").doc(userProfilesList[widget.index]['debtor_id']).update(
                        {
                          'summa': summa1, // qarz miqdori

                          }).then((_){
                             print("success!");
                           });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ListScreen()) );
                    },
                  ),
                  RoundedButton(
                    text: "Ayirish",
                    color: Colors.red,
                    press: () {
                      print("Ayirish Button bosildi") ;
                      var myDouble = double.parse(summaController.text);
                      assert(myDouble is double);
                      var myDouble2 = double.parse(userProfilesList[widget.index]['summa'].toString());
                      assert(myDouble2 is double);
                      double summa1 = myDouble2 - myDouble ;
                      print(myDouble2);
                      var firebaseUser =  FirebaseAuth.instance.currentUser;
                      print(firebaseUser.uid);
                      firestoreInstance.collection("debtor").doc(userProfilesList[widget.index]['debtor_id']).update(
                          {
                            'summa': summa1, // qarz miqdori

                          }).then((_){
                        print("success!");
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ListScreen()) );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
