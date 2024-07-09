import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
part 'allapointments_state.dart';

class AllapointmentsCubit extends Cubit<AllapointmentsState> {
  List allapointment=[];
  dynamic message;
  AllapointmentsCubit() : super(AllapointmentsInitial());
   Future<dynamic>? showspecificAppointment(dynamic reservedDay,dynamic doctId
   )async {
          emit(Allappointmentloading());
    try {

  dynamic appointResp= await http.post(
    Uri.parse('https://clever-rose-mite.cyclic.app/appointment/apponintment-by-day'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<dynamic, dynamic>{
       
    "reservedDay" : reservedDay,
    "doctorID" :doctId
    }),

  );

   Map<String, dynamic> dataa = jsonDecode(appointResp.body);
    if(appointResp.statusCode==200){
         emit(Allappointmentsuccess());
    dynamic allappoint=dataa['response'];
     allapointment.clear();
    for(dynamic i in allappoint){
     
   allapointment.add(i);
    }
   }

   return appointResp;
} on Exception catch (e) {
  emit(Allappointmentfailure());
  int t=0;
 return t;
}
  }
  Future<dynamic>? showAppointment(dynamic dId
   )async {
          emit(Allappointmentloading());
    try {

  dynamic appresp= await http.post(
    Uri.parse('https://clever-rose-mite.cyclic.app/appointment/all-appointments-for-doctor'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<dynamic, dynamic>{
      "doctorID" :dId,
     
    }),

  );
  Map<String, dynamic> dataa = jsonDecode(appresp.body);
   if(appresp.statusCode==200){
  emit(Allappointmentsuccess());
 dynamic filedata=dataa['response'];
    allapointment.clear();
for(dynamic i in filedata){
  
  //print(i);
allapointment.add(i);      
}
  }
   return appresp;
} on Exception catch (e) {
  emit(Allappointmentfailure());
  int t=0;
 return t;
}
  }
Future<dynamic>? deleteAppointment(dynamic docId
   )async {
          emit(Allappointmentloading());
    try {

  dynamic appointResp= await http.post(
    Uri.parse('https://clever-rose-mite.cyclic.app/appointment/delete-all-appointments-by-doctor-id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<dynamic, dynamic>{
       
    "doctorID" : docId
    }),

  );
   emit(Allappointmentsuccess());
    if(appointResp.statusCode==200){
    Map<String, dynamic> dataa = jsonDecode(appointResp.body);
    message=dataa['message'];
   }
  //print(dataa);
   return appointResp;
} on Exception catch (e) {
  emit(Allappointmentfailure());
  int t=0;
 return t;
}
  }
}
