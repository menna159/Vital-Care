import 'dart:async';
import 'package:flutter/material.dart';
class Logo extends StatefulWidget {
 const Logo({super.key});

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  @override
  void initState() {
  Timer(
    const Duration(seconds: 5),(() {
      Navigator.of(context).pushReplacementNamed('/doc_or_patient');
      
    }));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      
        body:  Center(
          child: Image(image:AssetImage('images/logo.png'),
          fit: BoxFit.fill,),
        ));
  }
}
