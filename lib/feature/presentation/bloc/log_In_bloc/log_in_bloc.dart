import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:meta/meta.dart';
import 'package:rent_home/core/error/failure.dart';
import 'package:rent_home/core/services/storage_service.dart';
import 'package:rent_home/core/usecases/usecases.dart';
import 'package:rent_home/core/utils/app_locale_keys.dart';
import 'package:rent_home/core/utils/location_permission.dart';
import 'package:rent_home/feature/data/models/auth/request_log_In_model.dart';
import 'package:rent_home/feature/data/models/auth/response_log_in_model.dart';
import 'package:rent_home/feature/domain/usecase/auth_usecase/log_in_use_case.dart';
import 'package:rent_home/feature/presentation/bloc/sign_up_bloc/sign_up_bloc.dart';

import '../../../../injection_container.dart';

part 'log_in_event.dart';

part 'log_in_state.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final storageService = sl<StorageService>();
  late final LogInUseCase logInUseCase;

  LogInBloc({required LogInUseCase useCase}) : super(LogInInitialState()) {
    logInUseCase = useCase;
    on<LogInLoadedEvent>((event, emit) async {
      emit(LogInLoadingState());
      if (emailController.text.isEmpty && passwordController.text.isEmpty) {
        emit(LogInInputErrorState(
            email: AppLocaleKeys.fillField, password: AppLocaleKeys.fillField));
      } else if (emailController.text.isEmpty) {
        emit(LogInInputErrorState(
            email: AppLocaleKeys.fillField, password: null));
      } else if (passwordController.text.isEmpty) {
        emit(LogInInputErrorState(
            email: null, password: AppLocaleKeys.fillField));
      } else if (!emailController.text.contains(AppLocaleKeys.gmail) &&
          passwordController.text.length < 6) {
        emit(LogInInputErrorState(
            email: AppLocaleKeys.emailError,
            password: AppLocaleKeys.passwordError));
      } else if (!emailController.text.contains(AppLocaleKeys.gmail)) {
        emit(LogInInputErrorState(
            email: AppLocaleKeys.emailError, password: null));
      } else if (passwordController.text.length < 6) {
        emit(LogInInputErrorState(
            email: null, password: AppLocaleKeys.passwordError));
      } else {
        try {
          final response = await logInUseCase(
              LogInParams(logInModel: event.requestLogInModel));
          response.fold(
            (l) => emit(LogInFailureState(failure: mapFailureToString(l))),
            (r) async {
              print("AccessToken:${r.accessToken}");
              print("RefreshToken:${r.refreshToken}");

              try {
                await storageService.putAccessToken(r.accessToken);
                await storageService.putRefreshToken(r.refreshToken);
              } catch (e) {
                print(e);
              }
              add(LogInSuccessEvent(responseLogInModel: r));
            },
          );
        } on DioException catch (e) {
          switch (e.response?.data[AppLocaleKeys.error]) {
            case (AppLocaleKeys.invalidCredentials):
              return emit(
                  LogInFailureState(failure: AppLocaleKeys.errorPassword));
            case (AppLocaleKeys.errorUser):
              return emit(
                  LogInFailureState(failure: AppLocaleKeys.userNotFound));
            default:
              return emit(
                  LogInFailureState(failure: AppLocaleKeys.serverError));
          }
        } catch (e) {
          emit(LogInFailureState(
              failure: mapFailureToString(e.toString() as Failure)));
        }
      }
    });
    on<LogInVisibilityEvent>((event, emit) {
      emit(LogInVisibilityState(isVisible: event.isVisible));
    });

    on<LogInSuccessEvent>((event, emit) {
      emit(LogInSuccessState(responseLogInModel: event.responseLogInModel));
    });
  }
}
