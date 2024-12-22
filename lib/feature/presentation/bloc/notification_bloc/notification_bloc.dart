import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rent_home/core/services/storage_service.dart';

import '../../../../injection_container.dart';

part 'notification_event.dart';

part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final storage = sl<StorageService>();

  NotificationBloc() : super(NotificationInitialState()) {
    on<NotificationLoadedEvent>((event, emit) async {
      List list = await storage.getNotificationsIndex();
      String time = await storage.getLogInTime();

      emit(NotificationSuccessState(indexs: list, time));
    });

    on<NotificationReadEvent>((event, emit) async {
      List list = await storage.getNotificationsIndex();
      String time = await storage.getLogInTime();
      if (!list.contains(event.index)) {
        list.add(event.index);
      }

      await storage.putNotificationsIndex(list);
      emit(NotificationSuccessState(indexs: list, time));
    });
  }
}
