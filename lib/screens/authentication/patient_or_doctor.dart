import 'package:final_dart/screens/all_Patient.dart';
import 'package:final_dart/screens/appointments%20(2).dart';
import 'package:final_dart/screens/bot.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../components/bottomNavigation_bar.dart';
import '../../components/button.dart';
import '../../components/navbar.dart';
import '../add_patient.dart';
import '../all_doctors.dart';

class PatientOrDoc extends StatefulWidget {
const  PatientOrDoc({super.key});

  @override
  State<PatientOrDoc> createState() => _PatientOrDocState();
}

class _PatientOrDocState extends State<PatientOrDoc> {
  SharedPreferences? typeperson;
  String? type;
  @override
  void initState() {
    super.initState();
    checkIfSelected();
  }

  var pages = <Widget>[AllDocs(), const  Appointments(),const BotPage()];
  int selectedIndexxxx = 0;
  int counter = 0;
  void onItemTapped(int index) {
    setState(() {
      selectedIndexxxx = index;
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      bottomNavigationBar:
          Barr(onClicked: onItemTapped, selectedIndex: selectedIndexxxx),
      backgroundColor: Colors.white,
      body: counter == 0
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Column(
                    children: [
              const        SizedBox(
                        height: 30,
                      ),

                      SizedBox(
                        width: 237,
                        height: 240,
                        child: Image.asset('images/Rectangle 1.png'),
                      ),
                   const   Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 35),
                        child: Text(
                          'Your doctor any time\n         any where',
                          style:
                              TextStyle(fontSize: 15, color: Color(0xffA0A0A0)),
                        ),
                      ),
                   const   SizedBox(
                        height: 50,
                      ),
                    const  Row(
                        children: [
                          Center(
                            child: Text(
                              'Sign as',
                              style: TextStyle(
                                  fontSize: 20, color: Color(0xff777777)),
                            ),
                          ),
                        ],
                      ),
                   const   SizedBox(
                        height: 18,
                      ),
                      Buttonn(
                          text: 'Patient',
                          onPressed: () {
                            typeperson?.setString('type', 'patient');

                            Navigator.pushNamed(context, '/signinpatient');
                          }),
                   const   SizedBox(
                        height: 9,
                      ),
                   const   Text(
                        'Or',
                        style:
                            TextStyle(fontSize: 18, color: Color(0xff82C4C3)),
                      ),
                   const   SizedBox(
                        height: 9,
                      ),
                      Buttonn(
                          text: 'Doctor',
                          onPressed: () {
                            typeperson?.setString('type', 'doctor');
                            Navigator.pushNamed(context, '/sign_updoc');
                          }),
                   const   SizedBox(
                        height: 57,
                      ),
                    ],
                  ),
                ],
              ))
          : pages[selectedIndexxxx],
    );
  }
}

void checkIfSelected() async {
  typeperson = await SharedPreferences.getInstance();
  type = (typeperson?.getString('type') ?? '');
}
