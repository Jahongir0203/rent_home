part of 'saved_bloc.dart';

@immutable
sealed class SavedEvent {}

final class SavedLoadedEvent extends SavedEvent {}

final class SavedTrueEvent extends SavedEvent {

}

final class SavedFalseEvent extends SavedEvent {
  final HouseTypeModel house;

  SavedFalseEvent({required this.house});

}
