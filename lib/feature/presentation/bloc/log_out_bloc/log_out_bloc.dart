import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rent_home/core/services/storage_service.dart';
import 'package:rent_home/core/usecases/usecases.dart';
import 'package:rent_home/feature/domain/usecase/auth_usecase/log_out_use_case.dart';
import 'package:rent_home/feature/presentation/bloc/sign_up_bloc/sign_up_bloc.dart';

import '../../../../injection_container.dart';

part 'log_out_event.dart';

part 'log_out_state.dart';

class LogOutBloc extends Bloc<LogOutEvent, LogOutState> {
  final storageService = sl<StorageService>();
  late final LogOutUseCase logOutUseCase;

  LogOutBloc({required LogOutUseCase useCase}) : super(LogOutInitialState()) {
    logOutUseCase = useCase;
    on<LogOutLoadedEvent>((event, emit) async {
      try {
        final response = await logOutUseCase(
          const LogOutParams(email: 'jahongir@gmail.com'),
        );

        response.fold(
            (l) => emit(
                  LogOutFailureState(
                    failure: mapFailureToString(l),
                  ),
                ), (r) async {
          await storageService.clearAll();
          return emit(LogOutSuccessState());
        });
      } on DioException catch (e) {
        print(e);
        emit(
          LogOutFailureState(failure: e.response?.data[0]),
        );
      } catch (e) {
        emit(
          LogOutFailureState(failure: e.toString()),
        );
      }
    });
  }
}
