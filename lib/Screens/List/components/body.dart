import 'package:flutter/material.dart';
import 'package:debtors/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  ListView buildListView() {
    return ListView.builder(
      itemCount: 50,
      itemBuilder: (_, index) {
        return GestureDetector(
          onTap: () => {
            print('$index'),
          }

          ,
          child: Container
          (
            padding: EdgeInsets.symmetric(vertical: 4,horizontal: 10),
                      child: ClipRRect(
              borderRadius: BorderRadius.circular(29),
              
                        child: Container(
                        
                          color: kPrimaryYellow,
                                             child: ListTile(
                title: Text(
                  '${index+1}. Asadbek Bekchanov',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                  ),
                ),
               trailing: Icon(
                 Icons.add,
                 size: 30,
                 color: Colors.blue,
              ),
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
          
         },
        child: Icon(
          Icons.add_circle_rounded,
          size: 40,
          ),),
      body: Container(
        child: Stack(
          children: [
            Image.asset("assets/images/background.png"),
            buildListView(),
          ],
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
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
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: 28,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
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
