import 'package:flutter/material.dart';
// ignore: must_be_immutable
class Search extends StatelessWidget {
   Search({super.key});
 Color search =const Color(0xffAFCDCD);
  Color iconsearch =const Color(0xffB8DFDF);
  Color border =const Color(0xffD9E7E6);
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: border,
                      ),
                    ),
                    labelText: 'search',
                    labelStyle: TextStyle(color: search),
                    prefixIcon: Icon(
                      Icons.search,
                      color: iconsearch,
                    )),
              );
  }
}
