part of 'drawer_bloc.dart';

@immutable
sealed class DrawerEvent {}

final class DrawerLoadedEvent extends DrawerEvent {
  final int index;

  DrawerLoadedEvent({required this.index});
}
