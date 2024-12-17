part of 'detail_bloc.dart';

@immutable
sealed class DetailState {}

final class DetailInitialState extends DetailState {}

final class DetailLoadingState extends DetailState {}

final class DetailSavedState extends DetailState {}

final class DetailUnSavedState extends DetailState {}
