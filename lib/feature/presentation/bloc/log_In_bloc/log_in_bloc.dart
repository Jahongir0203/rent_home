import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:rent_home/core/usecases/usecases.dart';
import 'package:rent_home/feature/data/models/auth/request_log_In_model.dart';
import 'package:rent_home/feature/data/models/auth/response_log_in_model.dart';
import 'package:rent_home/feature/domain/usecase/auth_usecase/log_in_use_case.dart';
import 'package:rent_home/feature/presentation/bloc/sign_up_bloc/sign_up_bloc.dart';

part 'log_in_event.dart';

part 'log_in_state.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late final LogInUseCase logInUseCase;

  LogInBloc({required LogInUseCase useCase}) : super(LogInInitialState()) {
    logInUseCase = useCase;
    on<LogInLoadedEvent>((event, emit) async {
      emit(LogInLoadingState());

      final response =
          await logInUseCase(LogInParams(logInModel: event.requestLogInModel));

      try {
        response.fold(
          (l) => emit(LogInFailureState(failure: mapFailureToString(l))),
          (r) => emit(LogInSuccessState(responseLogInModel: r)),
        );
      } catch (e) {
        emit(LogInFailureState(failure: e.toString()));
      }
    });
    on<LogInVisibilityEvent>((event, emit) {
      emit(LogInVisibilityState(isVisible: event.isVisible));
    });
  }
}
