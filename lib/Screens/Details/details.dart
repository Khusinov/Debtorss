import 'package:debtors/companents/text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:debtors/constants.dart';
import 'package:flutter/services.dart';

class DetailPage extends StatelessWidget {
  DetailPage(this.index);

  final int index;

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
      body: Stack(
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
                        "Asadbek Bekchanov",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
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
                        "+99899-457-66-78",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
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
                        "360 000 so\'m",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                TextFieldContainer(
                  child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new TextField(
                            decoration: new InputDecoration(
                                labelText: "Pul miqdorini kiriting"),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ], // Only numbers can be entered
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
