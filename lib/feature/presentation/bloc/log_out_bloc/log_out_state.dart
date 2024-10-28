part of 'log_out_bloc.dart';

@immutable
sealed class LogOutState {}

final class LogOutInitialState extends LogOutState {}

final class LogOutLoadingState extends LogOutState {}

final class LogOutSuccessState extends LogOutState {}

final class LogOutFailureState extends LogOutState {
  final String failure;

  LogOutFailureState({required this.failure});
}
