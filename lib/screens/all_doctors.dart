import 'dart:core';

import 'package:flutter/material.dart';

import '../components/card_doc.dart';
import '../components/search.dart';

// ignore: must_be_immutable
class AllDocs extends StatelessWidget {
  Color search =const Color(0xffAFCDCD);
  Color iconsearch = const Color(0xffB8DFDF);
  Color border =const Color(0xffD9E7E6);

  AllDocs({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData query = MediaQuery.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
          Card(
            
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              'images/Vector 2.png',
              fit: BoxFit.fitWidth,
              width: double.infinity,
              height: 197,
            ),
          ),
          Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               const SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(top: 60, left: 23),
                        child: Text(
                          'Hi,',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: 23),
                        child: Text(
                          'find your doctor',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: 23),
                        child: Text(
                          'by name or city',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 90.0, right: 2),
                  child: SizedBox(
                    width: 190,
                    height: 80,
                    child: Image.asset(
                      'images/Online Doctor-rafiki.png',
                      width: 400,
                      height: 400,
                    ),
                  ),
                ),
              ],
            ),
            Card(
                color:const Color(0XffF5F5F5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                clipBehavior: Clip.antiAlias,
                child:
                    Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                 
                  Padding(
                    padding: const EdgeInsets.only(left: 22, right: 22, top: 20),
                    child: SizedBox(width: query.size.width, child: Search()),
                  ),
                 const SizedBox(
                    height: 17,
                  ),
                 const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(left: 25.0, bottom: 5),
                        child: Text('All Doctors',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xff82C4C3),
                            )),
                      ),
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 17, right: 17),
                      child: CardDoc(
                          image: Image.asset(
                            'images/Rectangle 3332.png',
                          ),
                          docname: const Text('Dr: Mohamed sameh'),
                          docspecialization:const Text(
                            'Speialization',
                            style: TextStyle(fontSize: 10),
                          ))),
                 const   SizedBox(
                    height: 12,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 17, right: 17),
                      child: CardDoc(
                          image: Image.asset('images/Rectangle 3334.png'),
                          docname:const Text('Dr: Ahmed Mohamed'),
                          docspecialization:const Text(
                            'Speialization',
                            style: TextStyle(fontSize: 10),
                          ))),
                const  SizedBox(
                    height: 12,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 17, right: 17),
                      child: CardDoc(
                          image: Image.asset('images/Rectangle 3332.png'),
                          docname:const Text('Dr: Sara Sameh'),
                          docspecialization:const Text(
                            'Speialization',
                            style: TextStyle(fontSize: 10),
                          ))),
                const  SizedBox(
                    height: 12,
                  ),
                  Padding(
                      padding:
                          const EdgeInsets.only(left: 17, right: 17, bottom: 120),
                      child: CardDoc(
                          image: Image.asset('images/Rectangle 3332.png'),
                          docname:const Text('Dr: Eslam Ahmed'),
                          docspecialization:const Text(
                            'Speialization',
                            style: TextStyle(fontSize: 10),
                          ))),
                ])),
          ]),
        ]),
      ),

// SizedBox(
      //   height: 25,
      // ),
    );
  }
}
