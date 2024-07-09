import 'dart:core';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/button.dart';
import '../../components/text_form_field.dart';
// import 'package:http/http.dart'as;
import 'package:flutter/material.dart';

import '../../components/show_snack_bar.dart';
import '../../cubits/authh_cubit/auth_cubit.dart';

class SignUpDoc extends StatefulWidget {
  const SignUpDoc({super.key});

  @override
  State<SignUpDoc> createState() => _SignUpDocState();
}

SharedPreferences? logindata;
String? email;

class _SignUpDocState extends State<SignUpDoc> {
  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    email = logindata?.getString('email');
  }

  final _formkey = GlobalKey<FormState>();

  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();

  TextEditingController namecontroller = TextEditingController();

  TextEditingController usernamecontroller = TextEditingController();

  TextEditingController specializationcontroller = TextEditingController();

  TextEditingController phonecontroller = TextEditingController();
  TextEditingController citycontroller = TextEditingController();

  TextEditingController datescontroller = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    MediaQueryData query = MediaQuery.of(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignUploadingdoc) {
          isLoading = true;
        } else if (state is SignUpSuccessdoc) {
          Navigator.pushNamed(context, '/login_doc');
          isLoading = false;
        } else if (state is SignUpFailuredoc) {
          showSnackbar(context, BlocProvider.of<AuthCubit>(context).error);

          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: isLoading,
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                // foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                elevation: 0,
              ),
              body: Form(
                key: _formkey,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Column(
                      children: [
                      const  Row(
                          children:  [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 10, left: 18, bottom: 17),
                              child: Text(
                                'Create Account',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontFamily: 'Inter'),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 21.0, right: 22.0),
                          child: SizedBox(
                              width: query.size.width,
                              child: CustomTextField(
                                controller: namecontroller,
                                func: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'please enter the name';
                                  } else {
                                    return null;
                                  }
                                },
                                type: TextInputType.name,
                                hintText: 'Full name',
                                icon:const Icon(Icons.person),
                              )),
                        ),
                       const SizedBox(
                          height: 9,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 21.0, right: 22.0),
                          child: SizedBox(
                              width: query.size.width,
                              child: CustomTextField(
                                controller: usernamecontroller,
                                func: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      value.length < 6) {
                                    return 'Enter the user name please';
                                  } else {
                                    return null;
                                  }
                                },
                                type: TextInputType.name,
                                hintText: 'user name',
                                icon:const Icon(Icons.person),
                              )),
                        ),
                      const  SizedBox(
                          height: 9,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 21.0, right: 22.0),
                          child: SizedBox(
                            width: query.size.width,
                            child: CustomTextField(
                              controller: emailcontroller,
                              func: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    !value.endsWith('.com')) {
                                  return 'wrong email';
                                } else {
                                  return null;
                                }
                              },
                              type: TextInputType.emailAddress,
                              hintText: 'Email',
                              icon:const Icon(Icons.email),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 9,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 21.0, right: 22.0),
                          child: SizedBox(
                            width: query.size.width,
                            child: CustomTextField(
                              controller: passwordcontroller,
                              func: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length < 6) {
                                  return 'wrong password';
                                } else {
                                  return null;
                                }
                              },
                              type: TextInputType.visiblePassword,
                              hintText: 'Password',
                              icon:const Icon(Icons.lock),
                            ),
                          ),
                        ),
                      const  SizedBox(
                          height: 9,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 22, right: 21),
                            child: CustomTextField(
                              controller: specializationcontroller,
                              func: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter your specialization please';
                                } else {
                                  return null;
                                }
                              },
                              type: TextInputType.name,
                              hintText: 'Specialization',
                              icon:const ImageIcon(
                                  AssetImage('images/doctor (3) 1.png')),
                            )),
                      const  SizedBox(
                          height: 9,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 22, right: 21),
                            child: CustomTextField(
                              controller: phonecontroller,
                              func: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter your correct phone please';
                                } else {
                                  return null;
                                }
                              },
                              type: TextInputType.phone,
                              hintText: 'phone',
                              icon:const Icon(Icons.phone),
                            )),
                      const  SizedBox(
                          height: 9,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 22, right: 21),
                            child: CustomTextField(
                              controller: datescontroller,
                              func: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter your correct date please';
                                } else {
                                  return null;
                                }
                              },
                              type: TextInputType.datetime,
                              hintText: 'Date',
                              icon:const Icon(Icons.date_range),
                            )),
                      const  SizedBox(
                          height: 9,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 22, right: 21),
                            child: CustomTextField(
                              controller: citycontroller,
                              func: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter your city please';
                                } else {
                                  return null;
                                }
                              },
                              type: TextInputType.name,
                              hintText: 'City',
                              icon:const Icon(Icons.location_city_rounded),
                            )),
                        const SizedBox(
                          height: 22,
                        ),
                        Buttonn(
                            text: ('Sign up'),
                            onPressed: () async {
                              if (_formkey.currentState!.validate()) {
                               
                                    BlocProvider.of<AuthCubit>(context)
                                        .signUpDoc(
                                            namecontroller.text,
                                            usernamecontroller.text,
                                            emailcontroller.text,
                                            passwordcontroller.text,
                                            phonecontroller.text,
                                            specializationcontroller.text,
                                            datescontroller.text,
                                            citycontroller.text);

                                // if (response['token'] != null) {
                                //   BlocProvider.of<AuthCubit>(context).docc =
                                //       DocAccountModel.fromjson(response);
                                // }
                              }
                            }),
                      const  SizedBox(
                          height: 10,
                        ),
                      const  Text(
                          'Or sign by',
                          style: TextStyle(color: Color(0xff82C4C3)),
                        ),
                      const  SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 24,
                              width: 24,
                              child: (Image.asset('images/Google.png')),
                            ),
                          const  SizedBox(
                              width: 7,
                            ),
                            SizedBox(
                                height: 24,
                                width: 24,
                                child: Image.asset(
                                  'images/Circle.png',
                                )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              child:const Padding(
                                padding:
                                     EdgeInsets.only(left: 20, top: 20),
                                child: Row(
                                  children: [
                                    Text(
                                      'Already have an account?',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xffA0A0A0),
                                          fontFamily: 'Inter'),
                                    ),
                                    Text(
                                      'sign in',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff82C4C3),
                                          fontFamily: 'Inter'),
                                    ),
                                  ],
                                ),
                              ),
                              onPressed: () {
                                email != null
                                    ? Navigator.pushNamed(context, '/home_doc')
                                    : Navigator.pushNamed(
                                        context, '/login_doc');
                              },
                            )
                          ],
                        ),
                        Align(
                            alignment: Alignment.bottomRight,
                            child: SizedBox(
                                height: 92,
                                width: 105,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Image.asset('images/1.jpg'),
                                ))),
                      ],
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
