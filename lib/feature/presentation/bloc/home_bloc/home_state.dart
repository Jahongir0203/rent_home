part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitialState extends HomeState {}

final class HomeSuccessState extends HomeState {
  final GetHousesResponse housesResponse;
  final String? currentLocation;
  final int count;
  final bool isFirstTime;
  HomeSuccessState({
    required this.housesResponse,
    required this.currentLocation,
    required this.count,
    required this.isFirstTime
  });
}

final class HomeLoadingState extends HomeState {}

final class HomeFailureState extends HomeState {
  final String failure;

  HomeFailureState({required this.failure});
}
