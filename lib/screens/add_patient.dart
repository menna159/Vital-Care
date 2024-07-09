import 'dart:io';
import 'package:final_dart/components/textfield.dart';
import 'package:final_dart/cubits/authh_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../components/show_snack_bar.dart';
import '../components/small_button.dart';
import '../cubits/patientt_cubit/patient_cubit.dart';

class AddPatient extends StatefulWidget {
  const AddPatient({super.key});

  @override
  State<AddPatient> createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  bool isLoading = false;
  String? filePath;
  dynamic gender;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController fullname = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController treatment = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController? date = TextEditingController();
  TextEditingController cancertype = TextEditingController();
  TextEditingController diagnosis = TextEditingController();
  TextEditingController abnormalSyptoms = TextEditingController();
  TextEditingController notes = TextEditingController();
  TextEditingController age = TextEditingController();

  TextEditingController additionalInformation = TextEditingController();
  final imagePicker = ImagePicker();
  List<XFile>? images;
  dynamic image;
  final _formkey = GlobalKey<FormState>();
  uploadImage() async {
    var pickedimage = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedimage != null) {

      setState(() {
        // image = File(pickedimage.path);
        image = File(pickedimage.path);
      });
    } else {
      image = 'images/Rectangle 3332.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData query = MediaQuery.of(context);

    return BlocConsumer<PatientCubit, AddPatientState>(
      listener: (context, state) {
        if (state is AddPatientloading) {
          isLoading = true;
        } else if (state is AddPatientsuccess) {
          showSnackbar(context, 'patient added successfuly!');

          Navigator.pushNamed(context, '/allPatient');
          isLoading = false;
        } else if (state is AddPatientfailure) {
          showSnackbar(context, 'An error occured!');

          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: isLoading,
            child: Form(
              key: _formkey,
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                ),
                body: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding:const EdgeInsets.only(left: 19, right: 19),
                      child: Column(
                        children: [
                         const Row(
                            children: [
                              Text(
                                'Add Patient',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                         const SizedBox(
                            height: 28,
                          ),
                          SizedBox(
                            width: query.size.width,
                            child: CustomTextField(
                              h: 3,
                              func: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter the correct name please';
                                } else {
                                  return null;
                                }
                              },
                              input: fullname,
                              type: TextInputType.name,
                              text: 'Full name',
                              width: 313.37,
                              height: 56.76,
                            ),
                          ),
                        const  SizedBox(
                            height: 19,
                          ),
                          SizedBox(
                            width: query.size.width,
                            child: CustomTextField(
                              func: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length < 6) {
                                  return 'Enter the correct user name please';
                                } else {
                                  return null;
                                }
                              },
                              h: 3,
                              input: username,
                              type: TextInputType.name,
                              text: 'User name',
                              width: 313.37,
                              height: 56.76,
                            ),
                          ),
                        const  SizedBox(
                            height: 19,
                          ),
                          SizedBox(
                            width: query.size.width,
                            child: CustomTextField(
                              func: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    !value.endsWith('.com')) {
                                  return 'Enter the correct email please';
                                } else {
                                  return null;
                                }
                              },
                              h: 3,
                              input: email,
                              type: TextInputType.emailAddress,
                              text: 'Email',
                              width: 313.37,
                              height: 56.76,
                            ),
                          ),
                        const  SizedBox(
                            height: 19,
                          ),
                          SizedBox(
                            width: query.size.width,
                            child: CustomTextField(
                              func: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length < 6) {
                                  return 'Enter the correct password please';
                                } else {
                                  return null;
                                }
                              },
                              h: 3,
                              input: password,
                              type: TextInputType.visiblePassword,
                              text: 'Password',
                              width: 313.37,
                              height: 56.76,
                            ),
                          ),
                        const  SizedBox(
                            height: 19,
                          ),
                          SizedBox(
                            width: query.size.width,
                            child: CustomTextField(
                              func: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter the correct phone please';
                                } else {
                                  return null;
                                }
                              },
                              h: 3,
                              input: phone,
                              type: TextInputType.phone,
                              text: 'Phone',
                              width: 313.37,
                              height: 56.76,
                            ),
                          ),
                       const   SizedBox(
                            height: 19,
                          ),
                          SizedBox(
                            width: query.size.width,
                            child: CustomTextField(
                              func: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length < 3) {
                                  return 'Enter the correct cancer type please';
                                } else {
                                  return null;
                                }
                              },
                              h: 3,
                              input: cancertype,
                              type: TextInputType.text,
                              text: 'Cancer Type',
                              width: 313.37,
                              height: 56.76,
                            ),
                          ),
                       const   SizedBox(
                            height: 19,
                          ),
                          SizedBox(
                            width: query.size.width,
                            child: CustomTextField(
                              func: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length < 3) {
                                  return 'Enter the correct diagnosis please';
                                } else {
                                  return null;
                                }
                              },
                              h: 3,
                              input: diagnosis,
                              type: TextInputType.text,
                              text: 'Diagnosis',
                              width: 313.37,
                              height: 56.76,
                            ),
                          ),
                       const   SizedBox(
                            height: 19,
                          ),
                          SizedBox(
                            width: query.size.width,
                            child: CustomTextField(
                              func: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length < 3) {
                                  return 'Enter the correct treatment please';
                                } else {
                                  return null;
                                }
                              },
                              h: 3,
                              type: TextInputType.text,
                              input: treatment,
                              text: 'Treatment',
                              width: 313.37,
                              height: 56.76,
                            ),
                          ),
                        const  SizedBox(
                            height: 19,
                          ),
                          SizedBox(
                            width: query.size.width,
                            child: CustomTextField(
                              func: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length < 3) {
                                  return 'Enter the correct notes please';
                                } else {
                                  return null;
                                }
                              },
                              h: 3,
                              input: notes,
                              type: TextInputType.text,
                              text: 'Notes',
                              width: 313.37,
                              height: 56.76,
                            ),
                          ),
                        const  SizedBox(
                            height: 19,
                          ),
                          SizedBox(
                            width: query.size.width,
                            child: CustomTextField(
                              func: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length < 3) {
                                  return 'Enter the correct Abnormal_syptoms please';
                                } else {
                                  return null;
                                }
                              },
                              h: 3,
                              input: abnormalSyptoms,
                              type: TextInputType.text,
                              text: 'Abnormal syptoms ',
                              width: 313.37,
                              height: 56.76,
                            ),
                          ),
                        const  SizedBox(
                            height: 19,
                          ),
                          SizedBox(
                            width: query.size.width,
                            child: CustomTextField(
                              func: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length < 3) {
                                  return 'Enter the correct Abnormal_syptoms please';
                                } else {
                                  return null;
                                }
                              },
                              h: 3,
                              input: additionalInformation,
                              type: TextInputType.text,
                              text: 'Additional information',
                              width: 313.37,
                              height: 56.76,
                            ),
                          ),
                        const  SizedBox(
                            height: 19,
                          ),
                          SizedBox(
                            width: query.size.width,
                            child: Row(
                              children: [
                                CustomTextField(
                                  func: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        value.length < 2) {
                                      return 'Enter the correct age please';
                                    } else {
                                      return null;
                                    }
                                  },
                                  h: 3,
                                  input: age,
                                  type: TextInputType.number,
                                  text: 'Age',
                                  width: 140,
                                  height: 60,
                                ),
                               const SizedBox(
                                  width: 40,
                                ),
                                CustomTextField(
                                  func: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Enter the correct date please';
                                    } else {
                                      return null;
                                    }
                                  },
                                  h: 3,
                                  input: date!,
                                  type: TextInputType.datetime,
                                  text: 'Date',
                                  width: 140,
                                  height: 60,
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RadioListTile(
                                title:const Text("Male"),
                                value: "male",
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(() {
                                    gender = value.toString();
                                  });
                                },
                              ),
                              RadioListTile(
                                title:const Text("Female"),
                                value: "female",
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(() {
                                    gender = value.toString();
                                  });
                                },
                              ),
                            ],
                          ),
                         const SizedBox(
                            width: 68,
                          ),
                        ],
                      ),
                    ),
                   const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 19, bottom: 30),
                          child: SmallButton(
                              text: 'Cancel',
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                              colortext: const Color(0xff82C4C3),
                              colorbackground: Colors.white),
                        ),
                      const  SizedBox(
                          width: 35,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15, bottom: 30),
                          child: SmallButton(
                              text: 'Save',
                              onPressed: () async {
                                // print(image);
                                if (_formkey.currentState!.validate()) {
                                  BlocProvider.of<PatientCubit>(context)
                                      .addpatient(

                                    doctorId:
                                        BlocProvider.of<AuthCubit>(context)
                                            .doctorId,
                                    fullname: fullname.text,
                                    username: username.text,
                                    email: email.text,
                                    password: password.text,
                                    phone: phone.text,
                                    age: age.text,
                                    cancertype: cancertype.text,
                                    diagnosis: diagnosis.text,
                                    // date: Date?.text,
                                    abnormalSyptoms: abnormalSyptoms.text,
                                    additionalInformation:
                                        additionalInformation.text,
                                    treatment: treatment.text,
                                    notes: notes.text,
                                    gender: gender.toString(),
                                  );
                                }
                              },
                              colortext: Colors.white,
                              colorbackground: const Color(0xff82C4C3)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ));
      },
    );
  }
}
