part of 'log_in_bloc.dart';

@immutable
sealed class LogInEvent {}

class LogInLoadedEvent extends LogInEvent {
  final RequestLogInModel requestLogInModel;

  LogInLoadedEvent({required this.requestLogInModel});
}

class LogInVisibilityEvent extends LogInEvent {
  final bool isVisible;

  LogInVisibilityEvent({required this.isVisible});
}

class LogInSuccessEvent extends LogInEvent {
  final ResponseLogInModel responseLogInModel;
  final bool isFirstTime;

  LogInSuccessEvent(
      {required this.responseLogInModel, required this.isFirstTime});
}
