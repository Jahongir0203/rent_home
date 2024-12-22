import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rent_home/core/error/exceptions.dart';
import 'package:rent_home/core/services/storage_service.dart';
import 'package:rent_home/core/utils/app_locale_keys.dart';
import 'package:rent_home/core/utils/location_permission.dart';
import 'package:rent_home/feature/data/models/house/get_houses_response.dart';
import 'package:rent_home/feature/data/models/position_model.dart';
import 'package:rent_home/feature/domain/repository/house_repository/house_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final TextEditingController searchController = TextEditingController();
  final HouseRepository houseRepository;
  final StorageService storageService;

  HomeBloc({required this.houseRepository, required this.storageService})
      : super(HomeInitialState()) {
    on<HomeLoadedEvent>((event, emit) async {
      emit(HomeLoadingState());
      bool isFirstTime = await storageService.getFirstTime();
      var currentLocation = await storageService.getCurrentLocation();
      List list = await storageService.getNotificationsIndex();
      int count = notifications.length - list.length;
      final String currentLoc;
      if (currentLocation == null) {
        final Position position = await determinePosition();
        await storageService.putCurrentPosition(position);
        List<Placemark> placemarks = await placemarkFromCoordinates(
            position.latitude, position.longitude);
        PositionModel? a = await storageService.getCurrentPosition();
        if (a != null) {
          print('Lat;${a.latitude} Long;${a.longitude}');
        }

        if (placemarks[0].locality != null) {
          currentLocation = placemarks[0].locality!;
          await storageService.putCurrentLocation(placemarks[0].locality!);
        }
      } else {
        currentLocation = await storageService.getCurrentLocation();
      }
      try {
        final response = await houseRepository.getHouses();
        response.fold(
          (left) {
            emit(HomeFailureState(
                failure: left.errorMessage ?? AppLocaleKeys.unexpectedError));
          },
          (right) {
            emit(HomeSuccessState(
                housesResponse: right,
                currentLocation: currentLocation,
                isFirstTime: isFirstTime,
                count: count));
          },
        );
      } on DioException catch (e) {
        emit(HomeFailureState(failure: e.error.toString()));
      } on ServerException catch (e) {
        emit(HomeFailureState(failure: e.toString()));
      } catch (e) {
        emit(HomeFailureState(failure: e.toString()));
      }
    });

    on<HomeSuccessEvent>((event, emit) async {
      await storageService.putFirstTime(event.isFirstTime);
      emit(HomeSuccessState(
          housesResponse: event.housesResponse,
          currentLocation: event.currentLocation,
          count: event.count,
          isFirstTime: event.isFirstTime));
    });
  }
}
