part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

final class HomeLoadedEvent extends HomeEvent {}

final class HomeSuccessEvent extends HomeEvent {
  final GetHousesResponse housesResponse;
  final String? currentLocation;
  final int count;
  final bool isFirstTime;

  HomeSuccessEvent(
      {required this.housesResponse,
      required this.currentLocation,
      required this.count,
      required this.isFirstTime});
}
