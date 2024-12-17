import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rent_home/core/services/storage_service.dart';
import 'package:rent_home/feature/data/models/house_model.dart';

import '../../../../injection_container.dart';
import '../../../data/models/house/get_houses_response.dart';

part 'detail_event.dart';

part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final StorageService storageService = sl<StorageService>();

  DetailBloc() : super(DetailInitialState()) {
    on<DetailLoadedEvent>((event, emit) async {
      emit(DetailLoadingState());
      List<HouseTypeModel>? houses =
          (await storageService.getSavedHouses()).cast<HouseTypeModel>();
      List<String> housesId = [];
      for (var element in houses) {
          housesId.add(element.id ?? '');
        }
          if (housesId.contains(event.houseId)) {
        emit(DetailSavedState());
      } else {
        emit(DetailUnSavedState());
      }
    });

    on<DetailUnSavedEvent>((event, emit) async {
      List<HouseTypeModel>? houses =
          (await storageService.getSavedHouses()).cast<HouseTypeModel>();
      houses.removeWhere(
        (element) {
          return element.id == event.houseId;
        },
      );
          await storageService.putSavedHouse(houses);
          emit(DetailUnSavedState());
    });

    on<DetailSavedEvent>((event, emit) async {
      List houses =
          (await storageService.getSavedHouses()).cast<HouseTypeModel>();
      houses.add(HouseTypeModel(
          id: event.house.id,
          price: event.house.price,
          description: event.house.description,
          address: event.house.description,
          bathrooms: event.house.bathrooms,
          bedrooms: event.house.bedrooms,
          createdAt: event.house.createdAt,
          imageUrl: [
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbQtjTMY6jRkgZaJiXeqD_uettleSc1ppg_g&s"
          ],
          latitude: event.house.latitude,
          leaseDuration: event.house.leaseDuration,
          leaseTerms: event.house.leaseTerms,
          listingStatus: event.house.listingStatus,
          longitude: event.house.longitude,
          ownerId: event.house.ownerId,
          propertyType: event.house.propertyType,
          roommateCount: event.house.roommateCount,
          squareFootage: event.house.squareFootage,
          topStatus: event.house.topStatus,
          updatedAt: event.house.updatedAt));
      await storageService.putSavedHouse(houses ?? []);
      emit(DetailSavedState());
    });
  }
}
