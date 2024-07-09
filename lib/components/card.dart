import 'package:flutter/material.dart';
// ignore: must_be_immutable
class CustomCard extends StatelessWidget {
  CustomCard({super.key, required this.image, required this.text, required this.ontap});
  @override
  String image;
  String text;
  VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: SizedBox(
        width: 150,
        height: 143.05,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 6,
          child: Column(
            children: [
              Image.asset(image) // Image(
              ,
              Text(
                text,
                style:const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
