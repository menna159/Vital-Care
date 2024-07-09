import 'package:flutter/material.dart';
 
class Cancelled extends StatelessWidget {
  const Cancelled({super.key});
   
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 26),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Image.asset(
                    'images/udikdoido.png',
                  ),
                ),
                title:const Text(
                  'Appointment Cancelled!',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w500),
                ),
              ),
             const Padding(
                padding:  EdgeInsets.only(left: 25, top: 14),
                child: Text(
                  'An appointment with Nada mohamed has been cancelled on monday',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff787B80)),
                ),
              ),
            const  SizedBox(
                height: 20,
              ),
            const  Divider(
                thickness: 1,
                indent: 13,
                endIndent: 13,
                color: Color.fromARGB(255, 182, 185, 189),
              )
            ],
          ),
        )
      ],
    );
  }
}

// ignore: must_be_immutable
class NewAppointments extends StatelessWidget {
   NewAppointments({super.key, required this.name, required this.day});
dynamic day;
 dynamic name;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 13),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Image.asset(
                    "images/photo_2023-07-17_14-50-06.jpg",
                  ),
                ),
                title:const Text(
                  'New appointment',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 14),
                child: Text(
                  'You have appointment with $name on $day',
                  style:const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff787B80)),
                ),
              ),
            const  SizedBox(
                height: 20,
              ),
            const  Divider(
                thickness: 1,
                indent: 13,
                endIndent: 13,
                color: Color.fromARGB(255, 182, 185, 189),
              )
            ],
          ),
        )
      ],
    );
  }
}
