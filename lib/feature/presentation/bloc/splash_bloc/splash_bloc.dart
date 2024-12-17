import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rent_home/core/services/storage_service.dart';

import '../../../../injection_container.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final storage = sl<StorageService>();

  SplashBloc() : super(SplashInitialState()) {
    on<SplashLoadedEvent>((event, emit) async {
      String? accessToken = await storage.getAccessToken();
      await Future.delayed(
        const Duration(seconds: 4),
        () {
          emit(SplashSuccessState(accessToken: accessToken));
        },
      );
    });
  }
}
