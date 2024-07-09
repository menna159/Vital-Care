import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../components/appontments_weigets (2).dart';
import '../cubits/allapointments_cubit.dart';
import '../cubits/authh_cubit/auth_cubit.dart';

class Appointments extends StatefulWidget {
  const Appointments({super.key});

  @override
  State<Appointments> createState() => _AppointmentsState();
}

Color search =const Color(0xffAFCDCD);
Color iconsearch =const Color(0xffB8DFDF);
Color border =const Color(0xffD9E7E6);

class _AppointmentsState extends State<Appointments> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllapointmentsCubit, AllapointmentsState>(
        builder: (context, state) {
      if (state is Allappointmentloading) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return Scaffold(
          appBar: AppBar(
            actions: [
              TextButton(
                  onPressed: ()  {
                     BlocProvider.of<AllapointmentsCubit>(context)
                        .deleteAppointment('64369d55f52cda6cf3a4c2af');
                    BlocProvider.of<AllapointmentsCubit>(context)
                        .allapointment
                        .clear();
                  },
                  child:const Center(
                    child: Text(
                      'Delete All',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff82C4C3),
                          fontWeight: FontWeight.w400),
                    ),
                  ))
            ],
            leading: IconButton(
                color: Colors.black,
                icon:const Icon(Icons.arrow_back),
                onPressed: () {
                    Navigator.pop(context);
                }),
            title:const Center(
              child: Text(
                "Appointment",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff000000),
                ),
              ),
            ),
            shadowColor: Colors.transparent,
            backgroundColor: Colors.transparent,
          ),
          body: SingleChildScrollView(
            physics:const ScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 24, top: 25),
                    child: TextFormField(
                      onFieldSubmitted: (value) async {
                        
                            await BlocProvider.of<AllapointmentsCubit>(context)
                                .showspecificAppointment(
                                    value,
                                    BlocProvider.of<AuthCubit>(context)
                                        .docc
                                        ?.dId);
                        setState(() {
                         
                              BlocProvider.of<AllapointmentsCubit>(context)
                                  .allapointment;
                        });
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: border,
                            ),
                          ),
                          labelText: 'search',
                          labelStyle: TextStyle(color: search),
                          prefixIcon: Icon(
                            Icons.search,
                            color: iconsearch,
                          )),
                    )),
                BlocProvider.of<AllapointmentsCubit>(context)
                        .allapointment
                        .isEmpty
                    ? Container()
                    : ListView.builder(
                        physics:const NeverScrollableScrollPhysics(),
                        itemCount: BlocProvider.of<AllapointmentsCubit>(context)
                            .allapointment
                            .length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          //print('done');
                          return Slidable(
                            endActionPane: ActionPane(
                              motion:const StretchMotion(),
                              children: [
                                SlidableAction(
                                  icon: Icons.delete,
                                  backgroundColor: Colors.red,
                                  label: 'Delete',
                                  onPressed: (context) => dismiss(index),
                                )
                              ],
                            ),
                            child: NewAppointments(
                              name:
                                  BlocProvider.of<AllapointmentsCubit>(context)
                                      .allapointment[index]['patientName'],
                              day: BlocProvider.of<AllapointmentsCubit>(context)
                                  .allapointment[index]['reservedDay'],
                            ),
                          );
                        },
                      )
              ],
            ),
          ),
        );
      }
    });
  }

  dismiss(int indexx) {
    dynamic user =
        BlocProvider.of<AllapointmentsCubit>(context).allapointment[indexx];
    setState(() {
      BlocProvider.of<AllapointmentsCubit>(context).allapointment.remove(user);
    });
  }
}
