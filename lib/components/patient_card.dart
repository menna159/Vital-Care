import 'package:flutter/material.dart';
// ignore: must_be_immutable
class PatientCard extends StatelessWidget {
  PatientCard({super.key, this.name, this.cancerType,this.func});
  String? name;
  String? cancerType;
  VoidCallback? func;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: func,
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 20),
        child: SingleChildScrollView(
          child: Container(
            width: 280,
            decoration: BoxDecoration(
              borderRadius:const BorderRadius.all(Radius.circular(10)),
              border: Border.all(width: 1, color:const Color(0xff82C4C3)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$name',
                        style:const TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      ),
                      // SizedBox(width: 40,),
                    const  SizedBox(
                        width: 2,
                      ),
                      Text(
                        '$cancerType',
                        style:const TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                const  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed('/edit_pati');
                          },
                          child:const Text(
                            'Edit',
                            style: TextStyle(
                              color: Color(0xff82C4C3),
                              fontSize: 16,
                            ),
                          )),
                      Row(
                        children: [
                        const  Text(
                            'Add Treatment',
                            style: TextStyle(
                              color: Color(0xff82C4C3),
                              fontSize: 16,
                            ),
                          ),
                          Image.asset('images/Edit 3.png')
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
