
import 'package:flutter/material.dart';
import '../../components/button.dart';
import '../../components/text_form_field.dart';

// ignore: must_be_immutable
class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});
  TextEditingController resetPassword = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool? isLoading = false;
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
              const  SizedBox(
                  height: 68,
                ),
                SizedBox(
                    height: 163.48,
                    width: 163.48,
                    child:
                        Image.asset('images/forgot password illustration.png')),
              const  Row(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(top: 42.64, left: 65),
                      child: Text(
                        'Reset your password',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: 'Inter'),
                      ),
                    ),
                  ],
                ),
              const  SizedBox(
                  height: 55,
                ),
                Form(
                  key: _formkey,
                  child: CustomTextField(
                    controller: resetPassword,
                    hintText: 'New Password',
                    icon:const Icon(Icons.lock),
                    func: (value) {
                      if (value == null || value.isEmpty || value.length < 6) {
                        return 'wrong password';
                      } else {
                        return null;
                      }
                    },
                    type: TextInputType.visiblePassword,
                  ),
                ),
              const  SizedBox(
                  height: 20,
                ),
                Buttonn(
                  text: 'Reset Password',
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      // BlocProvider.of<AuthCubit>(context)
                      //     .resetPassword(email: ResetPassword.text);
                      Navigator.pushNamed(context,'/reset_success');
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
