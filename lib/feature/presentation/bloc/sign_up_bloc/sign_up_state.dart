part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitialState extends SignUpState {}

final class SignUpLoadingState extends SignUpState {}

final class SignUpSuccessState extends SignUpState {
  final ResponseRegisterModel responseRegisterModel;

  SignUpSuccessState({required this.responseRegisterModel});
}

final class SignUpFailureState extends SignUpState {
  final String failure;

  SignUpFailureState({required this.failure});
}

final class SignUpVisibilityState extends SignUpState {
  final bool isVisible1;
  final bool isVisible2;

  SignUpVisibilityState({required this.isVisible2,required this.isVisible1});
}
