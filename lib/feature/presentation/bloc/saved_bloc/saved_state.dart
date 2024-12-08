part of 'saved_bloc.dart';

@immutable
sealed class SavedState {}

final class SavedInitialState extends SavedState {}

final class SavedLoadingState extends SavedState {}

final class SavedSuccessState extends SavedState {
  final List<HouseTypeModel> houses;

  SavedSuccessState({required this.houses});
}

final class SavedEmptyState extends SavedState {}

final class SavedFailureState extends SavedState {
  final String failure;

  SavedFailureState({required this.failure});
}
