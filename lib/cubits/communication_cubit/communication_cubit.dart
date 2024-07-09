import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:http/http.dart" as http;
part 'communication_state.dart';

class CommunicationCubit extends Cubit<CommunicationState> {
  CommunicationCubit() : super(CommunicationInitial());
  late String message;
 Future<dynamic>? communicaton(dynamic id,dynamic whats, dynamic telegram, dynamic facebookk, dynamic gmail,
   )async {
          emit(Communicationloading());
    try {

  dynamic commresp= await http.post(
    Uri.parse('https://project-zxjs.onrender.com/communicationWays/store-ways'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<dynamic, dynamic>{
      'd_id':id,
      "WhatsApp_Link":whats,
   "Telegram_Link":telegram,
   "FaceBook_Link":facebookk,
   "Gmail_Link":gmail
    }),

  );
   emit(CommunicationSuccess());
       return commresp;
} on Exception catch (e) {
  emit(CommunicationFailure(errorMessage: 'something went wrong'));
  int t=0;
 return t;
}
  }



}
