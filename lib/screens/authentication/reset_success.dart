
import 'package:flutter/material.dart';
import '../../components/button.dart';

// ignore: must_be_immutable
class ResetSuccess extends StatelessWidget {
  ResetSuccess({super.key});
  bool? isLoading = false;
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
               const SizedBox(
                  height: 69.64,
                ),
                SizedBox(
                    height: 163.48,
                    width: 163.48,
                    child: Image.asset(
                        'images/forgot password illustration (2).png')),
              const  Row(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(top: 42.64, left: 90),
                      child: Text(
                        'Reset successful',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: 'Inter'),
                      ),
                    ),
                  ],
                ),
              const  SizedBox(
                  height: 14,
                ),
              const  Padding(
                  padding:  EdgeInsets.only(left: 90, right: 64),
                  child: Row(
                    children: [
                      Text(
                        'You can now log in to your account',
                        style: TextStyle(
                            fontSize: 10,
                            color: Color(0xff777777),
                            fontFamily: 'Inter'),
                      ),
                    ],
                  ),
                ),
              const  SizedBox(
                  height: 20,
                ),
                Buttonn(
                  text: 'Login',
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      Navigator.pushNamed(context,'/HomeDoc');
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 255, top: 168),
                  child: SizedBox(
                      width: 105,
                      height: 92,
                      child: Image.asset('images/1.jpg')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
