part of 'reset_password_bloc.dart';

@immutable
sealed class ResetPasswordState {}

final class ResetPasswordInitialState extends ResetPasswordState {}

final class ResetPasswordLoadingState extends ResetPasswordState {}

final class ResetPasswordSuccessState extends ResetPasswordState {
  final String success;

  ResetPasswordSuccessState({required this.success});
}

final class ResetPasswordFailureState extends ResetPasswordState {
  final String failure;

  ResetPasswordFailureState({required this.failure});
}

final class ResetPasswordInputErrorState extends ResetPasswordState {
  final String? code;
  final String? email;
  final String? newPassword;

  ResetPasswordInputErrorState({this.code, this.email, this.newPassword});
}

final class ResetPasswordVisibilityState extends ResetPasswordState {
  final bool isVisible;

  ResetPasswordVisibilityState({required this.isVisible});
}
