import 'dart:convert';

import 'package:final_dart/models/signin_patientModel.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../models/doc_accountModel.dart';
import '../../models/error_message.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  dynamic resp;
  dynamic doctorId;
  dynamic id;

  Future signUpDoc(
      String name,
      String username,
      String email,
      String password,
      String phone,
      String specialization,
      String dates,
      String cityName) async {
    emit(SignUploadingdoc());
    http.Response response = await post(
      Uri.parse('https://clever-rose-mite.cyclic.app/doctor/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'username': username,
        "email": email,
        "password": password,
        "phone": phone,
        "specialization": specialization,
        "Dates": dates,
        "city": cityName,
      }),
    );
    if (response.statusCode == 200) {
      emit(SignUpSuccessdoc());
    } else {
      emit(SignUpFailuredoc(errorMessage: 'Something went wrong'));
   
    }
  }

  late String message;
  ErrorMessage? error;

  AuthCubit() : super(LoginInitialdoc());
  DocAccountModel? docc;
  PatientSigninModel? patient;

  Future<dynamic>? loginDoc(
      {required String email, required String password}) async {
    emit(Loginloadingdoc());

    dynamic resp = await http.post(
      Uri.parse('https://clever-rose-mite.cyclic.app/doctor/signin'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{"email": email, "password": password}),
    );
    Map<dynamic, dynamic> dataa = jsonDecode(resp.body);
    if (resp.statusCode == 200) {
      docc = DocAccountModel.fromjson(dataa);
      emit(LoginSuccessdoc());
      doctorId = docc?.dId;
      id = docc?.id;
      return dataa;
    } else {
      emit(LoginFailuredoc(errorMessage: 'wrong'));
      return message;
    }
  }

  Future<dynamic>? loginPat(
      {required String email, required String password}) async {
    emit(Loginloadingdoc());

    dynamic resp = await http.post(
      Uri.parse('https://clever-rose-mite.cyclic.app/patient/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{"patientEmail": email, "patientPassword": password}),
    );
    Map<String, dynamic> dataa = jsonDecode(resp.body);

    if (resp.statusCode == 200) {
      patient = PatientSigninModel.fromjson(dataa);
      emit(LoginSuccesspat());
      return dataa;
    } else {
      message = resp.body;

      emit(LoginFailurepat(errorMessage: "something went wrong"));
      return dataa;
    }
  }

  Future resetPassword({required String email}) async {
    emit(Forgetpasswordloading());
    http.Response response = await post(
      Uri.parse('https://project-zxjs.onrender.com/setting/req-reset-password'),
      body: jsonEncode(<String, String>{
        "email": email,
      }),
    );
    headers:
    <String, String>{
      'Content-Type': 'application/json',
      'Accept': '*/*',
      'Connection': 'keep-alive'
    };
    if (response.statusCode == 200) {
      emit(ForgetpasswordSuccess());

      return response;
    } else {
      message = response.body;

      emit(ForgetpasswordFailure(errorMessage: 'something went wrong'));

      return response;
    }
  }
}

Future<void> changePassword(String newPassword) async {
  await SharedPreferences.getInstance();
   String url = 'https://project-zxjs.onrender.com/setting/new-password';
  try {
    await http.post(
      Uri.parse(url),
      body: json.encode(
        {
          // 'idToken': _token,
          'password': newPassword,
          'returnSecureToken': true,
        },
      ),
    );
  } catch (error) {
    throw error;
  }
}

  