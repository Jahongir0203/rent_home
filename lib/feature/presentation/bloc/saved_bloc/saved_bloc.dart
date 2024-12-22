import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/services/storage_service.dart';
import '../../../../injection_container.dart';
import '../../../data/models/house_model.dart';

part 'saved_event.dart';

part 'saved_state.dart';

class SavedBloc extends Bloc<SavedEvent, SavedState> {
  final StorageService storageService = sl<StorageService>();

  SavedBloc() : super(SavedInitialState()) {
    on<SavedLoadedEvent>((event, emit) async {
      try {
        List<HouseTypeModel>? houses =
            (await storageService.getSavedHouses()).cast<HouseTypeModel>();

        if (houses.isNotEmpty) {
           emit(SavedSuccessState(houses: houses));
        } else {
          emit((SavedEmptyState()));
        }
      } catch (e) {
        emit(SavedFailureState(failure: e.toString()));
      }
    });

    on<SavedFalseEvent>((event, emit) async {
      try {
        List<HouseTypeModel> houses =
            (await storageService.getSavedHouses()).cast<HouseTypeModel>();

        if (houses.isNotEmpty) {
          houses.remove(event.house);
          await storageService.putSavedHouse(houses);
          if (houses.isNotEmpty) {
            emit(SavedSuccessState(houses: houses));
          } else {
            emit((SavedEmptyState()));
          }
        } else {
          emit((SavedEmptyState()));
        }
      } catch (e) {
        emit(SavedFailureState(failure: e.toString()));
      }
    });
  }
}
