part of 'forgot_password_bloc.dart';

@immutable
sealed class ForgotPasswordEvent {}

final class ForgotPasswordLoadedEvent extends ForgotPasswordEvent {

}
