part of 'drawer_bloc.dart';

@immutable
sealed class DrawerState {}

final class DrawerInitial extends DrawerState {}

final class DrawerSuccessState extends DrawerState {
  final int index;

  DrawerSuccessState({required this.index});
}

final class DrawerLogOutState extends DrawerState {}
