part of 'log_out_bloc.dart';

@immutable
sealed class LogOutEvent {}

final class LogOutLoadedEvent extends LogOutEvent {}
final class LogOutSuccessEvent extends LogOutEvent {}
