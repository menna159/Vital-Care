import 'package:flutter/material.dart';
// ignore: must_be_immutable
class Features extends StatelessWidget {
  Features(
      {super.key, this.ontap,
      required this.width,
      required this.height,
      required this.image});
  double? height;
  double? width;
  String? image;
  VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:  ontap,
       // Navigator.of(context).pushReplacementNamed('/logo');
       
     
      child: Image.asset(
        '$image',
        width: width,
        height: height,
      ),
    );
  }
}