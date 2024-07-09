import 'package:flutter/material.dart';
// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key, this.text,
      required this.width,
      required this.height,
      required this.input,
      required this.type,
      this.func,
      @required this.h
      //this.b,this.r
      });
  String? text;
  double width;
  double height;
  TextInputType? type;
  TextEditingController input = TextEditingController();
  String? Function(String?)? func;
  // double? b;
  double? h;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        keyboardType: type,
        controller: input,
        validator: func,
        decoration: InputDecoration(
          // hintMaxLines: int.fromEnvironment(name),
          contentPadding: EdgeInsets.symmetric(vertical: h!, horizontal: 10),
          labelText: text,
          focusedBorder:const OutlineInputBorder(
            gapPadding: 12,
            borderRadius: BorderRadius.all(Radius.circular(6)),
            borderSide: BorderSide(
              color: Color(0xff0A9A9A),
            ),
          ),
          enabledBorder:const OutlineInputBorder(
            gapPadding: 12,
            borderRadius: BorderRadius.all(Radius.circular(6)),
            borderSide: BorderSide(
              color: Color(0xff0A9A9A),
            ),
          ),
          border:const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            borderSide: BorderSide(
              color: Color(0xff0A9A9A),
            ),
          ),
        ),
      ),
    );
  }
}
