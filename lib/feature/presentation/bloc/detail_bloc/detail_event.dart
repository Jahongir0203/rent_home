part of 'detail_bloc.dart';

@immutable
sealed class DetailEvent {}

final class DetailLoadedEvent extends DetailEvent {
  final String houseId;

  DetailLoadedEvent({required this.houseId});
}

final class DetailSavedEvent extends DetailEvent {
  final House house;

  DetailSavedEvent({required this.house});
}

final class DetailUnSavedEvent extends DetailEvent {
  final String houseId;

  DetailUnSavedEvent({required this.houseId});
}
