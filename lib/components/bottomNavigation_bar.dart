import 'package:flutter/material.dart';
// ignore: must_be_immutable
class Barr extends StatelessWidget {
  Barr({super.key, this.selectedIndex, this.onClicked});
  // ignore: prefer_typing_uninitialized_variables
  final selectedIndex;
  ValueChanged<int>? onClicked;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedItemColor: const Color(0xff82C4C3),
        unselectedItemColor: Colors.grey, // Fixed
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/doctor (3) 1.png',
              width: 24,
              height: 24,
            ),
            label: 'Doctors',
          ),
         const BottomNavigationBarItem(
            icon:Icon(Icons.calendar_month), 
            // icon: Icon(Icons.qr_code_scanner),
            label: 'Appointments',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/chatbot (8).png',
              width: 24,
              height: 24,
            ),
            label: 'Chat bot',
          )
        ],
        currentIndex: selectedIndex,
        onTap: onClicked);
  }
}
