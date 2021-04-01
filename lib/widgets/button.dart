import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String iconPath;
  final bool flashOn;

  const Button({this.iconPath, this.flashOn});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.grey[850],
        //borderRadius: BorderRadius.circular(100.0),
        shape: BoxShape.circle,

        boxShadow: [
          BoxShadow(
            color: flashOn ? Color(0xff3d3d3d) : Colors.black38,
            offset: Offset(4.0, 4.0),
            blurRadius: 10.0,
            spreadRadius: 5.0,
          ),
          BoxShadow(
            color: flashOn ? Colors.black38 : Color(0xff3d3d3d),
            offset: Offset(-4.0, -4.0),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      padding: flashOn ? EdgeInsets.all(50) : null,
      child: Container(
        padding: EdgeInsets.only(top: 40, bottom: 20),
        //height: 200,
        //width: 200,
        decoration: BoxDecoration(
          color: Colors.grey[850],
          shape: BoxShape.circle,
          border:
              flashOn ? Border.all(color: Colors.yellow[50], width: 5) : null,
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              offset: Offset(4.0, 4.0),
              blurRadius: 10.0,
              spreadRadius: 4.0,
            ),
            BoxShadow(
              color: Color(0xff3d3d3d),
              offset: Offset(-4.0, -4.0),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ),
          ],
        ),
        child: Image(
          image: AssetImage(iconPath),
        ),
      ),
    );
  }
}
