import 'package:flutter/material.dart';
// ignore: must_be_immutable
class TreatmentCard extends StatelessWidget {
  TreatmentCard(
      {super.key, required this.treatmentName,
      this.treatmentDescription,
      required this.treatmentTimes});
  String? treatmentName;
  String? treatmentDescription;
  int? treatmentTimes;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {},
          child:const Icon(
            Icons.clear_rounded,
            color: Color(0xff82C4C3),
            size: 28,
          ),
        ),
        Card(
            color: Colors.transparent,
            elevation: 0,
            shape:const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Container(
              width: 322,
              height: 86,
              decoration: BoxDecoration(
                border: Border.all(
                  color:const Color(0xffD6E2E2),
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: kElevationToShadow[0],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 3, top: 19),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "$treatmentName",
                            style:const TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w600),
                          ),
                        const  SizedBox(
                            height: 8,
                          ),
                          Text(
                            "$treatmentDescription",
                            style:const TextStyle(
                                fontSize: 10, color: Color(0xffA0A0A0)),
                          ),
                        ],
                      ),
                    ),
                    trailing: Text(
                      "$treatmentTimes Times",
                      style:const TextStyle(fontSize: 10, color: Color(0xff82C4C3)),
                    ),
                  ),
                ],
              ),
            ))
      ],
    );
  }
}
