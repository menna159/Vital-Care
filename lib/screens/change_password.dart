import 'package:flutter/material.dart';
import '../components/button.dart';
import '../components/text_form_field.dart';

// ignore: must_be_immutable
class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});
  final _formkey = GlobalKey<FormState>();
  TextEditingController confirmpassword = TextEditingController();

  TextEditingController newpassword = TextEditingController();
  TextEditingController oldpassword = TextEditingController();
  bool isLoading = false;
  Map<String, dynamic>? data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Change Password'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          color: Colors.black,
          icon:const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Form(
              key: _formkey,
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const SizedBox(
                    height: 88,
                  ),
                  CustomTextField(
                    hintText: 'Old Password',
                    icon: const Icon(Icons.lock),
                    controller: oldpassword,
                    func: (p0) {
                      if (p0 == null || p0.isEmpty || p0.length < 6) {
                        return 'please enter correct password';
                      } else {
                        return null;
                      }
                    },
                    type: TextInputType.visiblePassword,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                    hintText: 'New Password',
                    icon: const Icon(Icons.lock),
                    controller: newpassword,
                    func: (p0) {
                      if (p0 == null || p0.isEmpty || p0.length < 6) {
                        return 'please enter correct password';
                      } else {
                        return null;
                      }
                    },
                    type: TextInputType.visiblePassword,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                    hintText: 'Confirm Password',
                    icon: const Icon(Icons.lock),
                    controller: confirmpassword,
                    func: (p0) {
                      if (p0 == null || p0.isEmpty || p0.length < 6) {
                        return 'please enter correct password';
                      } else {
                        return null;
                      }
                    },
                    type: TextInputType.visiblePassword,
                  ),
                  const SizedBox(
                    height: 42,
                  ),
                  Buttonn(
                      text: 'Submit',
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {}
                      }),
                  Padding(
                    padding: const EdgeInsets.only(left: 255, top: 135),
                    child: SizedBox(
                        width: 105,
                        height: 92,
                        child: Image.asset('images/1.jpg')),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
