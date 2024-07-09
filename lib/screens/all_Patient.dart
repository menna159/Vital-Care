import 'package:final_dart/cubits/authh_cubit/auth_cubit.dart';
import 'package:final_dart/cubits/patientt_cubit/patient_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../components/navbar.dart';
import '../components/patient_card.dart';
import '../components/show_snack_bar.dart';
class AllPatients extends StatefulWidget {
  const AllPatients({super.key});

  @override
  State<AllPatients> createState() => _AllPatientsState();
}

bool isloading = false;

class _AllPatientsState extends State<AllPatients> {
  dismiss(int indexx) {
    dynamic user = BlocProvider.of<PatientCubit>(context).allpat[indexx];
    setState(() {
      BlocProvider.of<PatientCubit>(context).allpat.remove(user);
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData query = MediaQuery.of(context);

    return BlocConsumer<PatientCubit, AddPatientState>(
      listener: (context, state) {
        if (state is AllPatientsByNameLoading) {
          isloading = true;
        } else if (state is AllPatientsByNameSuccess) {
          // ShowSnackbar(context, BlocProvider.of<AuthCubit>(context).message);
          showSnackbar(context, 'success');
          // BlocProvider.of<PatientCubit>(context).allpatientbyName;
          isloading = false;
        } else if (state is AllPatientbyNamefailure) {
          // ShowSnackbar(context, BlocProvider.of<PatientCubit>(context).res);
          showSnackbar(context, 'failure');

          isloading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isloading,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              leading: IconButton(
                  color: Colors.black,
                  icon:const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/home_doc');
                  }),
              iconTheme:const IconThemeData(color: Colors.black),
              shadowColor: Colors.transparent,
              backgroundColor: Colors.white,
            ),
            endDrawer: Navbar(context,
                name: BlocProvider.of<AuthCubit>(context).docc?.name),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    width: 350,
                    height: 61,
                    child: TextFormField(
                      onFieldSubmitted: (value) async {
                      
                            await BlocProvider.of<PatientCubit>(context)
                                .allpatientbyName(value);
                        setState(() {
                         
                              BlocProvider.of<PatientCubit>(context).allpat;

                          //print(BlocProvider.of<AllapointmentsCubit>(context).allapointment);
                        });
                        //listofappointments= BlocProvider.of<AllapointmentsCubit>(context).allapointment;

                      },
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:const BorderSide(
                              color: Color(0xff82C4C3),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: 'search by name',
                          labelStyle:const TextStyle(
                            color: Color(0xffAFCDCD),
                          ),
                          prefixIcon:const Icon(
                            Icons.search,
                            color: Color(0xffAFCDCD),
                          )),
                    ),
                  ),
                ),
               const Row(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: 25),
                      child: Text(
                        'All Patients',
                        style: TextStyle(color: Color(0xff82C4C3)),
                      ),
                    ),
                  ],
                ),

              const  SizedBox(
                  height: 15,
                ),
                BlocProvider.of<PatientCubit>(context).allpat.isEmpty
                    ? Container()
                    : Flexible(
                        child: SizedBox(
                        height: query.size.height / 0.1,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                IconButton(
                                  icon:const Icon(CupertinoIcons.multiply),
                                  onPressed: () {
                                    dismiss(index);
                                    // BlocProvider.of<PatientCubit>(context)
                                    //     .deletepati(index);
                                  },
                                ),
                                PatientCard(
                                  func: () {
                                    BlocProvider.of<PatientCubit>(context).id =
                                        BlocProvider.of<PatientCubit>(context)
                                            .allpat[index]
                                            .id;
                                    BlocProvider.of<PatientCubit>(context)
                                            .diagnosis =
                                        BlocProvider.of<PatientCubit>(context)
                                            .allpat[index]
                                            .diagnosisOfDisease;
                                    BlocProvider.of<PatientCubit>(context)
                                            .treatment =
                                        BlocProvider.of<PatientCubit>(context)
                                            .allpat[index]
                                            .drugsNames;
                                    BlocProvider.of<PatientCubit>(context)
                                            .nottttte =
                                        BlocProvider.of<PatientCubit>(context)
                                            .allpat[index]
                                            .doctorInstructionsAndNotes;
                                    BlocProvider.of<PatientCubit>(context)
                                            .additionall =
                                        BlocProvider.of<PatientCubit>(context)
                                            .allpat[index]
                                            .additionalInfo;
                                    BlocProvider.of<PatientCubit>(context)
                                            .abnormal =
                                        BlocProvider.of<PatientCubit>(context)
                                            .allpat[index]
                                            .abnormalSymptoms;
                                    BlocProvider.of<PatientCubit>(context)
                                            .idddddd =
                                        BlocProvider.of<PatientCubit>(context)
                                            .allpat[index]
                                            .id;
                                    BlocProvider.of<PatientCubit>(context)
                                            .namee =
                                        BlocProvider.of<PatientCubit>(context)
                                            .allpat[index]
                                            .patientName;
                                    BlocProvider.of<PatientCubit>(context)
                                            .lastDate =
                                        BlocProvider.of<PatientCubit>(context)
                                            .allpat[index]
                                            .dateofVisit;
                                    BlocProvider.of<PatientCubit>(context)
                                            .emailll =
                                        BlocProvider.of<PatientCubit>(context)
                                            .allpat[index]
                                            .patientEmail;
                                    //     BlocProvider.of<PatientCubit>(context).Dateeee =
                                    // BlocProvider.of<PatientCubit>(context)
                                    //     .allpat[index]
                                    //     .pa;
                                    BlocProvider.of<PatientCubit>(context)
                                            .cancerTypeee =
                                        BlocProvider.of<PatientCubit>(context)
                                            .allpat[index]
                                            .cancerType;
                                    BlocProvider.of<PatientCubit>(context)
                                            .genderrr =
                                        BlocProvider.of<PatientCubit>(context)
                                            .allpat[index]
                                            .patientGender;
                                    BlocProvider.of<PatientCubit>(context)
                                            .ageee =
                                        BlocProvider.of<PatientCubit>(context)
                                            .allpat[index]
                                            .patientAge;
                                    BlocProvider.of<PatientCubit>(context)
                                            .phoneee =
                                        BlocProvider.of<PatientCubit>(context)
                                            .allpat[index]
                                            .patientPhoneNumber;
                                    Navigator.pushNamed(
                                        context, '/patientprof');
                                  },
                                  name: BlocProvider.of<PatientCubit>(context)
                                      .allpat[index]
                                      .patientName,
                                  cancerType:
                                      BlocProvider.of<PatientCubit>(context)
                                          .allpat[index]
                                          .cancerType,
                                ),
                              ],
                            );
                          },
                          itemCount: BlocProvider.of<PatientCubit>(context)
                              .allpat
                              .length,
                        ),
                      )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:const Color(0xff82C4C3),
                    ),
                    onPressed: () async {
                      Navigator.of(context)
                          .pushReplacementNamed('/add_patient');

                      // images = await picker.pickMultiImage();
                    },
                    child:const Icon(
                      Icons.add,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
