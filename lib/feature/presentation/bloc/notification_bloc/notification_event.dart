part of 'notification_bloc.dart';

@immutable
sealed class NotificationEvent {}

final class NotificationLoadedEvent extends NotificationEvent {}

final class NotificationReadEvent extends NotificationEvent {
  final int index;

  NotificationReadEvent({required this.index});
}
