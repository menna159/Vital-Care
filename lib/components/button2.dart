import 'package:flutter/material.dart';
// ignore: must_be_immutable
class Button2 extends StatelessWidget {
   Button2({super.key, required this.textt,required this.tcolor,required this.bcolor, required this.widthh});
String textt;
int tcolor;
double widthh;
int bcolor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
      },
      style: ElevatedButton.styleFrom(
         fixedSize: Size(widthh, 40),
         backgroundColor: Color(bcolor)
      ),
       child: Text(textt,style: TextStyle(color: Color(tcolor),fontSize: 17),),
    );
  }
}