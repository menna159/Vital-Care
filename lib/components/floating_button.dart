import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 48,
      child: FloatingActionButton.extended(
        backgroundColor:const Color(0xff82C4C3),
        label: const Text(
          'Chat with doctor',
          style: TextStyle(color: Colors.white, fontSize: 10),
        ),
        onPressed: () {},
        icon:const Icon(
          Icons.chat,
          color: Colors.white,
        ),
        shape:const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
      ),
    );
  }
}
