part of 'reset_password_bloc.dart';

@immutable
sealed class ResetPasswordEvent {}

final class ResetPasswordLoadedEvent extends ResetPasswordEvent {}

final class ResetPasswordVisibilityEvent extends ResetPasswordEvent {
  final bool isVisible;

  ResetPasswordVisibilityEvent({required this.isVisible});
}
