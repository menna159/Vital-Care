import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SmallButton extends StatelessWidget {
  SmallButton(
      {super.key, required this.text, required this.onPressed, required this.colortext,required this.colorbackground});
  Color colortext;
  Color colorbackground;
  String? text;
  VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(140, 60),
            backgroundColor: colorbackground,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: onPressed,
        child: Text(text!,
            style:  TextStyle(fontSize: 18, color: colortext)));
  }
}
