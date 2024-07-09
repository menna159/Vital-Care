part of 'patient_cubit.dart';

@immutable
abstract class AddPatientState {}

class AddPatientInitial extends AddPatientState {}

class AddPatientloading extends AddPatientState {}

class AddPatientsuccess extends AddPatientState {}

class AddPatientfailure extends AddPatientState {
  // String? error_message;
  // addPatientfailure({required this.error_message});
}

class ShowallPatientsInitial extends AddPatientState {}

class ShowAllPatientsloading extends AddPatientState {}

class ShowAllPatientsSuccess extends AddPatientState {}

class ShowAllPatientsFailure extends AddPatientState {
 
}

class AllPatientsByNameInitial extends AddPatientState {}

class AllPatientsByNameLoading extends AddPatientState {}

class AllPatientsByNameSuccess extends AddPatientState {}

class AllPatientbyNamefailure extends AddPatientState {
 
}
