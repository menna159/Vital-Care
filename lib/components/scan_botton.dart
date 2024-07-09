import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class ScanButton extends StatelessWidget {
  ScanButton({super.key, this.ontap, required this.image, required this.text});
  String? ontap, image, text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacementNamed('$ontap');
      },
      child: Column(
        children: [
          Container(
            width: 65,
            height: 65,
            decoration:const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffF3F3F3),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Image.asset(
                    '$image',
                    height: 40,
                    width: 40,
                  ),
                ),
              ],
            ),
          ),
       const   SizedBox(
            height: 10,
          ),
          Text(
            '$text',
            style:const TextStyle(color: Color(0xff82C4C3)),
          )
        ],
      ),
    );
  }
}
