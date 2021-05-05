import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({Key key, this.child}) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children:<Widget> [
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              "assets/images/bottomShape.png",
              width: size.width,
            ),
          )
        ],
      ),
    );
  }
}
