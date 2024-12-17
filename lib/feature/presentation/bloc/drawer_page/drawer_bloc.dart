import 'package:bloc/bloc.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:meta/meta.dart';

part 'drawer_event.dart';

part 'drawer_state.dart';

class DrawerBloc extends Bloc<DrawerEvent, DrawerState> {
  final AdvancedDrawerController advancedDrawerController=AdvancedDrawerController();
  DrawerBloc() : super(DrawerInitial()) {
    on<DrawerLoadedEvent>((event, emit) {
      event.index == 8
          ? emit(DrawerLogOutState())
          : emit(DrawerSuccessState(index: event.index));
    });
  }
}
