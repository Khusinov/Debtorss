import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:debtors/Screens/List/list_screen.dart';
import 'package:debtors/companents/text_field_container.dart';
import 'package:debtors/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class AddAccount extends StatefulWidget {
  // AddAccount({Key key}) : super(key: key);

  @override
  _AddAccountState createState() => _AddAccountState();
}

class _AddAccountState extends State<AddAccount> {
  String name ;
  final firestoreInstance = FirebaseFirestore.instance;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final TextEditingController debitorController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
          title: Text(
            'Qarzdor qo\'shish',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: Styles.paddingForm,
            child: ListView(
              children: <Widget>[
                buildTextField(nameController, "Ismi"),
                buildTextField(descController, "Izoh"),
                buildTextField(phoneController,"Telefon Raqam"),
                buildQuantityField(),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: FloatingActionButton(
                    onPressed: (){
                      var docId = getRandomString(10);
                            print("Called addAccount");
                            firestoreInstance.collection("debtor").doc(docId)
                                .set({
                                'user_id': 1, // user id
                                  'debtor_id':docId , // qarzdor id si
                                'name': nameController.text, // ismi
                                'summa': quantityController.text, // qarz miqdori
                                   'phone':phoneController.text,
                                'comment': descController.text, // izoh
                                'date': formattedDate  // MM/DD/YYYY
                                  }
                                ).then((value){
                              print("--");
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                builder: (context) => ListScreen()) );
                    },
                    child: Icon(Icons.check), ),

                  // color: Theme.of(context).accentColor,
                  //textColor: Colors.black,

                )
              ],
            ),
          ),
        ));
  }

Padding buildTextField(TextEditingController editController, String field) {
  return Padding(
    padding: Styles.paddingFields,
    child: TextFormField(
        controller: editController,
        decoration: InputDecoration(
          labelText: field,
          border: Styles.borderRounded,
        )),
  );
}
buildQuantityField() {
  return Padding(
    padding: Styles.paddingFields,
    child: TextFormField(
        keyboardType: TextInputType.number,
        controller: quantityController,
        decoration: InputDecoration(
          labelText: "Pul miqdori",
          border: Styles.borderRounded,
        )),

  );
}
  var _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}

