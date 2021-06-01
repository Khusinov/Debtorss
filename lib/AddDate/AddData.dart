import 'dart:math';

import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class AddData extends StatelessWidget {
  final int user_id;
  final String name;
  final String phone;
  final double summa;
  final String comment;
  final String date;

  AddData(this.user_id, this.name, this.phone , this.summa, this.comment, this.date);

  @override
  Widget build(BuildContext context) {
    CollectionReference debtor =
        FirebaseFirestore.instance.collection('debtor');

    Future<void> addData() {
      var docId = getRandomString(10);
      return debtor.doc(docId)
          .set({
            'user_id': user_id, // user id
            'debtor_id':docId , // qarzdor id si
            'name': name, // ismi
            'phone':phone ,
            'summa': summa, // qarz miqdori
            'comment': comment, // izoh
            'date': date // MM/DD/YYYY
          })
          .then((value) => print("Add Document"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return TextButton(
      onPressed: addData,
      child: Text(
        "Qarzdor qo'shildi ",
      ),
    );
  }
   var _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}
