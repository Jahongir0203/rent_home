part of 'log_in_bloc.dart';

@immutable
sealed class LogInState {}

final class LogInInitialState extends LogInState {}

final class LogInLoadingState extends LogInState {}

final class LogInSuccessState extends LogInState {
  final ResponseLogInModel responseLogInModel;

  LogInSuccessState({required this.responseLogInModel});
}

final class LogInFailureState extends LogInState {
  final String failure;

  LogInFailureState({required this.failure});
}

final class LogInVisibilityState extends LogInState {
  final bool isVisible;

  LogInVisibilityState({required this.isVisible});
}

// final class LogInEmailErrorState extends LogInState {
//   final String emailError;
//
//   LogInEmailErrorState({required this.emailError});
// }
//
// final class LogInPasswordErrorState extends LogInState {
//   final String passwordError;
//
//   LogInPasswordErrorState({required this.passwordError});
// }

final class LogInInputErrorState extends LogInState {
  final String? email;
  final String? password;

  LogInInputErrorState({required this.email, required this.password});
}
