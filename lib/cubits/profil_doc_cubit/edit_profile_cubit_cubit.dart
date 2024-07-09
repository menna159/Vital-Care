import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
part 'edit_profile_cubit_state.dart';

class EditProfileCubitCubit extends Cubit<EditProfileCubitState> {
  EditProfileCubitCubit() : super(EditDocProInitial());
  dynamic resp;
  dynamic msg;
  dynamic messg;
  Future editProfile(
      {dynamic docId,
      dynamic name,
      dynamic username,
      dynamic phone,
      dynamic specialization,
      dynamic dates,
      dynamic cityName}) async {
    emit(EditDocProLoading());
    http.Response response = await post(
      Uri.parse('https://clever-rose-mite.cyclic.app/doctorprofile/updatedr'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "doctorID": docId,
        'name': name,
        'username': username,
        // "email": email,
        // "password": password,
        "phone": phone,
        "specialization": specialization,
        "Dates": dates,
        "city": cityName,
      }),
    );
    Map<String, dynamic> dataa = jsonDecode(response.body);

    if (response.statusCode == 200) {
      emit(EditDocProSuccess());
      msg = dataa['message'];
    } else {
      emit(EditDocProFailure());
    }
  }

  
}
