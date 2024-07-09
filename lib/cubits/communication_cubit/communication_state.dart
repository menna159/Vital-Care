part of 'communication_cubit.dart';

abstract class CommunicationState {}

class CommunicationInitial extends CommunicationState {}
class Communicationloading extends CommunicationState {}

class CommunicationSuccess extends CommunicationState {}

class CommunicationFailure extends CommunicationState {
  String errorMessage;
  CommunicationFailure({required this.errorMessage});
}