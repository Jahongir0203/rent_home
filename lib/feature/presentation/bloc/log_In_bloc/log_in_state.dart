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
