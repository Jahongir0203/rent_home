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

  SignUpVisibilityState({required this.isVisible2, required this.isVisible1});
}

final class SignUpInputErrorState extends SignUpState {
  final String? fullName;
  final String? phoneNumber;
  final String? email;
  final String? password;
  final String? confirmPassword;

  SignUpInputErrorState(
      {this.fullName,
      this.phoneNumber,
      this.email,
      this.password,
      this.confirmPassword});
}
