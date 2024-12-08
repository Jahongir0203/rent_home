part of 'notification_bloc.dart';

@immutable
sealed class NotificationState {}

final class NotificationInitialState extends NotificationState {}
final class NotificationSuccessState extends NotificationState {
 final List indexs;
 final String time;

  NotificationSuccessState(this.time, {required this.indexs});
}
