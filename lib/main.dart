import 'package:final_dart/cubits/allapointments_cubit.dart';
import 'package:final_dart/screens/add_patient.dart';
import 'package:final_dart/screens/all_Patient.dart';
import 'package:final_dart/screens/all_doctors.dart';
import 'package:final_dart/screens/appointments%20(2).dart';
import 'package:final_dart/screens/authentication/check_your_email.dart';
import 'package:final_dart/screens/authentication/reset_password.dart';
import 'package:final_dart/screens/authentication/reset_success.dart';
import 'package:final_dart/screens/authentication/sign_up_doc.dart';
import 'package:final_dart/screens/authentication/signin_patient.dart';
import 'package:final_dart/screens/bot.dart';
import 'package:final_dart/screens/change_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/authh_cubit/auth_cubit.dart';
import 'cubits/communication_cubit/communication_cubit.dart';
import 'cubits/patientt_cubit/patient_cubit.dart';
import 'cubits/profil_doc_cubit/edit_profile_cubit_cubit.dart';
import 'screens/Abnormal symptoms.dart';
import 'screens/authentication/forgot_password.dart';
import 'screens/authentication/patient_or_doctor.dart';
import 'screens/authentication/signin_doctor.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => AuthCubit(),
    ),
    BlocProvider(create: (context) => PatientCubit()),
    BlocProvider(
      create: (context) => CommunicationCubit(),
    ),
    BlocProvider(create: ((context) => EditProfileCubitCubit())),
    BlocProvider(create: (context) => AllapointmentsCubit())
  ], child:const VitalCare()));
}

dynamic themeMo;

class VitalCare extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  const VitalCare({super.key});
  @override
  Widget build(BuildContext context) {
    
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, currentMode, child) {
        child;
        return MaterialApp(
          theme: ThemeData(primarySwatch: Colors.grey),
          darkTheme: ThemeData.dark(),
          themeMode: currentMode,

          debugShowCheckedModeBanner: false,
          routes: {
            '/main': (context) =>const PatientOrDoc(),
            '/doc_or_patient': (context) =>const PatientOrDoc(),
            '/sign_updoc': (context) =>const SignUpDoc(),
            '/signinpatient': (context) => SigninPatient(),
            '/login_doc': (context) =>const SigninDoc(),
            '/forget_pass': (context) => ForgotPassword(),
 
            '/bot': (context) =>const BotPage(),
            '/allPatient': (context) =>const AllPatients(),
            '/all_docs': (context) => AllDocs(),

            '/checkemail': (context) => CheckYourEmail(),
            '/reset_pass': (context) => ResetPassword(),
            '/reset_success': (context) => ResetSuccess(),
            '/add_patient': (context) =>const AddPatient(),
            '/change_pass': (context) => ChangePassword(),
            '/AbnormalSymptoms': (context) =>const AbnormalSymptoms(),
            '/all_appointment': (context) =>const Appointments(),
          },
          initialRoute: '/main',
        );
        
      },
    );

  }
}
