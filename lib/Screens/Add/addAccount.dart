import 'package:flutter/material.dart';

class AddAccount extends StatefulWidget {
  // AddAccount({Key key}) : super(key: key);

  @override
  _AddAccountState createState() => _AddAccountState();
}

class _AddAccountState extends State<AddAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          'Qarzdor qo\'shish',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 50.0,
          horizontal: 10.0,
        ),
        child: Column(
          children: <Widget>[
            TextFormField(
              autovalidate: true,
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Iltimos qarzdor ismini kiriting';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Ismi',
                hintText: 'Qarzdornig ismi',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: Icon(Icons.done),
      ),
    );
  }
}
