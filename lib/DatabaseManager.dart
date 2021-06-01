

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class DatabaseManager {
  final firestoreInstance = FirebaseFirestore.instance;
  final CollectionReference profileList =
   FirebaseFirestore.instance.collection('debtor');


  // Future<void> createUserData(
  //     String name, String gender, int score, String uid) async {
  //   return await profileList
  //       .document(uid)
  //       .setData({'name': name, 'gender': gender, 'score': score});
  // }
  //
  // Future updateUserList(String name, String gender, int score, String uid) async {
  //   return await profileList.document(uid).updateData({
  //     'name': name, 'gender': gender, 'score': score
  //   });
  // }

  Future getUsersData() async {
    List itemsList = [];

    firestoreInstance.collection("debtor").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        print(result.data());
      });
    });

    try {
      await firestoreInstance.collection("debtor").get().then((querySnapshot) {
        querySnapshot.docs.forEach((result) {
          itemsList.add(result.data());
          print("Result Data : ${result.data()}");
        });
      });
      print(" Itemlist ${itemsList }" );
      return  itemsList ;  // shu list qaytyabdi
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future getUsersList() async {
    List itemsList = [];

    try {
      await profileList.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          itemsList.add(element.data);
        });
      });
      print(itemsList.toString()) ;
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}