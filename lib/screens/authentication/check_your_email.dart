import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../components/button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

// ignore: must_be_immutable
class CheckYourEmail extends StatelessWidget {
  CheckYourEmail({super.key});
  TextEditingController controller = TextEditingController();
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
             const   SizedBox(
                  height: 68,
                ),
                SizedBox(
                    height: 163.48,
                    width: 163.48,
                    child: Image.asset('images/illustration (2).png')),
              const  Row(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(top: 34.9, left: 80),
                      child: Text(
                        'Check your Email',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: 'Inter'),
                      ),
                    ),
                  ],
                ),
              const  SizedBox(
                  height: 11,
                ),
              const  Row(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: 49, right: 51),
                      child: Text(
                        'Enter the verification code we just sent you on\n                     your email address.',
                        style: TextStyle(
                            fontSize: 10,
                            color: Color(0xff777777),
                            fontFamily: 'Inter'),
                      ),
                    ),
                  ],
                ),
              const  SizedBox(
                  height: 55,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 67, right: 66),
                  child: PinCodeTextField(
                      appContext: context,
                      controller: controller,
                      textStyle:const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.normal),
                      length: 4,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.underline,
                          fieldWidth: 44,
                          borderWidth: 2,
                          inactiveColor: Colors.grey,
                          activeColor: Colors.blue,
                          selectedColor: Colors.blue), onChanged: (String value) {  },
                      ),
                ),
                GestureDetector(
                  onTap: () {},
                  child:const Padding(
                    padding:  EdgeInsets.only(left: 15, top: 45),
                    child: Text(
                      'Didnt get a code? Resend',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontFamily: 'Inter'),
                    ),
                  ),
                ),
              const  SizedBox(
                  height: 20,
                ),
                Buttonn(
                  text: 'Submit',
                  onPressed: () {
                    Navigator.pushNamed(context,'/reset_pass');
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
