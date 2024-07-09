
import 'package:final_dart/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool swValue = false;
SharedPreferences? logindataa;

SharedPreferences? typeperson;
SharedPreferences? links;
String? type;
// ignore: must_be_immutable
class Navbar extends StatefulWidget {
  Navbar(this.cont, {super.key, this.name});
  dynamic name;
  BuildContext cont;
  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    logindataa = await SharedPreferences.getInstance();
    typeperson = await SharedPreferences.getInstance();
    links = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 60),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/edit_profil_doc');
                  },
                  child: CircleAvatar(
                    child: ClipOval(
                        child: Image.asset('images/Rectangle 3332.png')),
                  ),
                ),
              const  SizedBox(
                  width: 10,
                ),
                Text(widget.name ?? 'null')
              ],
            ),
          ),
       const   SizedBox(
            height: 20,
          ),
        const  Divider(endIndent: 50, indent: 50)
          ,
          ListTile(
            title:const Text('Dark Mode'),
            trailing: Switch(
              value: swValue,
              onChanged: (value) {
                setState(() {
                  swValue = value;
                  if (value == false) {
                   VitalCare .themeNotifier.value = ThemeMode.light;
                  } else {
                    VitalCare.themeNotifier.value = ThemeMode.dark;
                  }
                });
              },
            ),
          ),
          ListTile(
            title:const Text('profile'),
            leading:const Icon(Icons.person_rounded, color: Color(0xff82C4C3)),
            onTap: () {
              Navigator.of(context).pushNamed('/docprof');
            },
          ),
          ListTile(
            title:const Text('change password'),
            leading:const Icon(Icons.lock_outline_sharp, color: Color(0xff82C4C3)),
            onTap: () {
              Navigator.of(context).pushNamed('/change_pass');
            },
          ),
          ListTile(
            title:const Text(
              'CommunicationWays',
            ),
            leading: Image.asset(
              'images/Rectangle 3332.png',
              width: 20,
              height: 20,
            ),
            onTap: () {
              if (links?.getString('whatsapp') == null) {
                Navigator.pushNamed(context, '/communicationway');
              }
            },
          ),
          ListTile(
            title:const Text('Help'),
            leading:const Icon(Icons.help, color: Color(0xff82C4C3)),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/logo');
            },
          ),
       const   SizedBox(
            height: 150,
          ),
        const  Divider(endIndent: 50, indent: 50),
          ListTile(
            title:const Text(
              'logout',
              style: TextStyle(color: Color(0xff82C4C3)),
            ),
            leading:const Icon(Icons.login_outlined, color: Color(0xff82C4C3)),
            onTap: () {
              openDialog();
            },
          ),
        ],
      ),
    );
  }

  Future openDialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actionsAlignment: MainAxisAlignment.spaceBetween,
            shape:const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            content: SizedBox(
              height: 208,
              width: 220,
              child: Column(
                children: [
                  SizedBox(
                      height: 159,
                      width: 224,
                      child: Image.asset('imagesظRectangle 3332.png')),
                const  Text(
                    'Are you sure?',
                    style: TextStyle(color: Color(0XffA0A0A0), fontSize: 15),
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child:const Text(
                    'Cancel',
                    style: TextStyle(color: Color(0xff82C4C3), fontSize: 18),
                  )),
              TextButton(
                  onPressed: () {
                    logindataa?.remove('email');
                    typeperson?.remove('type');

                    Navigator.of(context)
                        .pushReplacementNamed('/doc_or_patient');
                  },
                  child:const Text(
                    'Yes',
                    style: TextStyle(color: Color(0xff82C4C3), fontSize: 18),
                  )),
            ],
          );
        });
  }
}
