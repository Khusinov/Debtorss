import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class AddData extends StatelessWidget {
  final int user_id;
  final String name;
  final double summa;
  final String comment;
  final String date;

  AddData(this.user_id, this.name, this.summa, this.comment, this.date);

  @override
  Widget build(BuildContext context) {
    CollectionReference debtor =
        FirebaseFirestore.instance.collection('debtor');

    Future<void> addData() {
      return debtor
          .add({
            'user_id': user_id, // user id
            'name': name, // ismi
            'summa': summa, // qarz miqdori
            'comment': comment, // izoh
            'date': date // MM/DD/YYYY
          })
          .then((value) => print("Data Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return TextButton(
      onPressed: addData,
      child: Text(
        "Qarzdor qo'shildi ",
      ),
    );
  }
}
