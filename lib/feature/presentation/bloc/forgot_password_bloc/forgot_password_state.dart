part of 'forgot_password_bloc.dart';

@immutable
sealed class ForgotPasswordState {}

final class ForgotPasswordInitialState extends ForgotPasswordState {}

final class ForgotPasswordSuccessState extends ForgotPasswordState {
  final ResponseForgotPasswordModel success;

  ForgotPasswordSuccessState({required this.success});
}

final class ForgotPasswordLoadingState extends ForgotPasswordState {}

final class ForgotPasswordFailureState extends ForgotPasswordState {
  final String failure;

  ForgotPasswordFailureState({required this.failure});
}

final class ForgotPasswordErrorState extends ForgotPasswordState{
  final String email;

  ForgotPasswordErrorState({required this.email});
}