import 'dart:convert';

import 'package:final_dart/models/Add_patient_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../models/error_message.dart';
part 'patient_state.dart';

class PatientCubit extends Cubit<AddPatientState> {
  // PatientCubit(super.initialState);
  String baseUrl = 'https://clever-rose-mite.cyclic.app/api/';
  String endpoints = 'patient/store';
  PatientCubit() : super(AddPatientInitial());
  dynamic id;
  dynamic res;
  dynamic resp;
  dynamic msg;
  dynamic mssg;
  dynamic respo;
  dynamic respon;
  AddPatientModel? pat;
  ErrorMessage? error;
  dynamic message;
  dynamic out;
  List allpatientts = [];
  dynamic idddddd;
  dynamic diagnosis;
  dynamic treatment;
  dynamic nottttte;
  dynamic abnormal;
  dynamic additionall;
  dynamic msag;
  dynamic msssssg;
  dynamic namee;
  dynamic emailll;
  dynamic dateeee;
  dynamic lastDate;
  dynamic cancerTypeee;
  dynamic phoneee;
  dynamic genderrr;
  dynamic ageee;
  dynamic flag = 0;
  List allapointment = [];
  Future<dynamic>? showspecificAppointment(
      dynamic reservedDay, dynamic doctId) async {
    emit(AddPatientloading());
    try {
      dynamic appointResp = await http.post(
        Uri.parse(
            'https://clever-rose-mite.cyclic.app/appointment/apponintment-by-day'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<dynamic, dynamic>{
          "reservedDay": reservedDay,
          "doctorID": doctId
        }),
      );

      Map<String, dynamic> dataa = jsonDecode(appointResp.body);
      if (appointResp.statusCode == 200) {
        emit(AddPatientsuccess());
        //Map<String, dynamic> dataa = jsonDecode(appointResp.body);
        dynamic allappoint = dataa['response'];
        allapointment.clear();
        for (dynamic i in allappoint) {
          allapointment.add(i);
        }
      }
      //print(dataa);
      return appointResp;
    } on Exception catch (e) {
      emit(AddPatientfailure());
      int t = 0;
      return t;
    }
  }

  Future<dynamic>? showAppointment(dynamic d_id) async {
    emit(AddPatientloading());
    try {
      dynamic appresp = await http.post(
        Uri.parse(
            'https://clever-rose-mite.cyclic.app/appointment/all-appointments-for-doctor'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<dynamic, dynamic>{
          "doctorID": d_id,
        }),
      );
      Map<String, dynamic> dataa = jsonDecode(appresp.body);
      flag = '3';
      if (appresp.statusCode == 200) {
        emit(AddPatientsuccess());

        dynamic filedata = dataa['response'];
        allapointment.clear();
        for (dynamic i in filedata) {
          //print(i);
          allapointment.add(i);
        }
      }

      return appresp;
    } on Exception catch (e) {
      emit(AddPatientfailure());
      int t = 0;
      return t;
    }
  }
  Future<dynamic>? deleteAppointment(dynamic docId) async {
    emit(AddPatientloading());
    try {
      dynamic appointResp = await http.post(
        Uri.parse(
            'https://clever-rose-mite.cyclic.app/appointment/delete-all-appointments-by-doctor-id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<dynamic, dynamic>{"doctorID": docId}),
      );
      emit(AddPatientsuccess());
      if (appointResp.statusCode == 200) {
        Map<String, dynamic> dataa = jsonDecode(appointResp.body);
        message = dataa['message'];
      }

      return appointResp;
    } on Exception catch (e) {
      emit(AddPatientfailure());
      int t = 0;
      return t;
    }
  }

  List<AddPatientModel> allpat = [];
  Future<dynamic>? addpatient(
      {required dynamic doctorId,
      required dynamic fullname,
      required dynamic username,
      required dynamic email,
      required dynamic password,
      required dynamic phone,
      required dynamic cancertype,
      required dynamic diagnosis,
      required dynamic treatment,
      required dynamic notes,
      required dynamic abnormalSyptoms,
      // required dynamic? date,
      required dynamic additionalInformation,
      required dynamic age,
      required dynamic gender}) async {
    emit(AddPatientloading());
    dynamic response = await post(
      Uri.parse('https://clever-rose-mite.cyclic.app/api/patient/store'),
      headers: <String, String>{
        'Content-Type': "application/json", 'Accept': '*/*'
      },
      body: jsonEncode(<dynamic, dynamic>{
        "d_id": doctorId,
        "patientName": fullname,
        "patientAge": age,
        "patientPhoneNumber": phone,
        "patientUsername": username,
        "patientEmail": email,
        "patientPassword": password,
        "cancerType": cancertype,
        "diagnosisOfDisease": diagnosis,
        "drugs_names": treatment,
        "patientGender": gender,
        "doctorInstructionsAndNotes": notes,
        "abnormal_Symptoms": abnormalSyptoms,
        "additional_Info": additionalInformation
      }
          ),
    );

    if (response.statusCode == 200) {
      emit(AddPatientsuccess());
    } else {
      emit(AddPatientfailure());
    }
  }

  Future<dynamic>? editpatient({
    // required dynamic? patient_id,
    required dynamic fullname,
    required dynamic username,
    required dynamic email,
    required dynamic password,
    required dynamic phone,
    required dynamic cancertype,
    required dynamic diagnosis,
    required dynamic treatment,
    required dynamic notes,
    required dynamic abnormalSyptoms,
    required dynamic additionalInformation,
    required dynamic age,

    required dynamic gender,
  }) async {
    emit(AddPatientloading());
    dynamic response = await put(
      Uri.parse('https://clever-rose-mite.cyclic.app/api/patient/update/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<dynamic, dynamic>{
        "patientName": fullname,
        "patientUsername": username,
        "patientEmail": email,
        "patientPassword": password,
        "patientPhoneNumber": phone,
        "patientAge": age,
        "cancerType": cancertype,
        "diagnosisOfDisease": diagnosis,
        "abnormal_Symptoms": abnormalSyptoms,
        "additional_Info": additionalInformation,
        "doctorInstructionsAndNotes": notes,
        "drugs_names": treatment,
        "patientGender": gender,
      }),
    );
    if (response.statusCode == 200) {
      emit(AddPatientsuccess());
    } else {
      emit(AddPatientfailure());
    }
  }

  Future<dynamic>? allpatientbyName(dynamic name) async {
    emit(AllPatientsByNameLoading());
    try {
      dynamic commresp = await http.post(
        Uri.parse(
            'https://clever-rose-mite.cyclic.app/api/patient/patient-by-patientname'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<dynamic, dynamic>{
          "patientName": name,
        }),
      );
      Map<String, dynamic> dataa = jsonDecode(commresp.body);
      if (commresp.statusCode == 200) {
        emit(AllPatientsByNameSuccess());
        dynamic filedata = dataa['response'];
        allpat.clear();
        for (dynamic i in filedata) {
          //print(i);
          allpat.add(AddPatientModel(
            id: i["_id"],
            dId: i["d_id"],
            patientName: i["patientName"],
            patientAge: i["patientAge"],
            patientPhoneNumber: i["patientPhoneNumber"],
            patientUsername: i["patientUsername"],
            patientEmail: i["patientEmail"],
            patientPassword: i["patientPassword"],
            cancerType: i["cancerType"],
            diagnosisOfDisease: i["diagnosisOfDisease"],
            drugsNames: i["drugs_names"],
            patientGender: i["patientGender"],
            dateofVisit: DateTime.parse(
              i["dateofVisit"],
            ),
            doctorInstructionsAndNotes: i["doctorInstructionsAndNotes"],
            abnormalSymptoms: i["abnormal_Symptoms"],
            additionalInfo: i["additional_Info"],
          ));
        }
      }

      return commresp;
    } on Exception catch (e) {
      emit(AllPatientbyNamefailure());
      int t = 0;
      return t;
    }
  }

  Future<dynamic>? showAllPatients({required dynamic dId}) async {
    emit(ShowAllPatientsloading());

    dynamic resp = await http.post(
      Uri.parse('https://clever-rose-mite.cyclic.app/api/patient/all-patients'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<dynamic, dynamic>{"d_id": dId}),
    );
    Map<String, dynamic> dataa = jsonDecode(resp.body);
    dynamic filedata = dataa['response'];
    if (resp.statusCode == 200) {
      emit(ShowAllPatientsSuccess());
      for (dynamic i in filedata) {
        allpat.add(AddPatientModel(
          id: i["_id"],
          dId: i["d_id"],
          patientName: i["patientName"],
          patientAge: i["patientAge"],
          patientPhoneNumber: i["patientPhoneNumber"],
          patientUsername: i["patientUsername"],
          patientEmail: i["patientEmail"],
          patientPassword: i["patientPassword"],
          cancerType: i["cancerType"],
          diagnosisOfDisease: i["diagnosisOfDisease"],
          drugsNames: i["drugs_names"],
          patientGender: i["patientGender"],
          dateofVisit: DateTime.parse(
            i["dateofVisit"],
          ),
          doctorInstructionsAndNotes: i["doctorInstructionsAndNotes"],
          abnormalSymptoms: i["abnormal_Symptoms"],
          additionalInfo: i["additional_Info"],
        ));
      }


      return dataa;
    } else {
      message = resp.body;
      msag = dataa['message'];
      emit(ShowAllPatientsFailure());
      return dataa['message'];
    }
  }
}

