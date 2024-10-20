part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {}

class SignUpLoadedEvent extends SignUpEvent {
  final RequestRegisterModel requestRegisterModel;

  SignUpLoadedEvent({required this.requestRegisterModel});
}

class SignUpPasswordEvent extends SignUpEvent{
  final bool isVisible1;
  final bool isVisible2;

  SignUpPasswordEvent({required this.isVisible1,required this.isVisible2});
}