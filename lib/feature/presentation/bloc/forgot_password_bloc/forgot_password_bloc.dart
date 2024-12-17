import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:rent_home/core/usecases/usecases.dart';
import 'package:rent_home/core/utils/app_locale_keys.dart';
import 'package:rent_home/feature/data/models/auth/response_forgot_password_model.dart';
import 'package:rent_home/feature/domain/usecase/auth_usecase/forgot_password_use_case.dart';
import 'package:rent_home/feature/presentation/bloc/sign_up_bloc/sign_up_bloc.dart';

part 'forgot_password_event.dart';

part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final TextEditingController emailController = TextEditingController();
  late final ForgotPasswordUseCase forgotPasswordUseCase;

  ForgotPasswordBloc({required ForgotPasswordUseCase useCase})
      : super(ForgotPasswordInitialState()) {
    forgotPasswordUseCase = useCase;
    on<ForgotPasswordLoadedEvent>((event, emit) async {
      emit(ForgotPasswordLoadingState());
      if (emailController.text.isEmpty) {
        emit(ForgotPasswordErrorState(email: AppLocaleKeys.fillField));
      } else if (!emailController.text.contains(AppLocaleKeys.gmail)) {
        emit(ForgotPasswordErrorState(email: AppLocaleKeys.emailError));
      } else {
        try {
          final response = await forgotPasswordUseCase(
              ForgotPasswordPrams(email: emailController.text));

          response.fold(
            (l) => emit(
                ForgotPasswordFailureState(failure: mapFailureToString(l))),
            (r) => emit(ForgotPasswordSuccessState(success: r)),
          );
        } on DioException catch (e) {
          switch (e.response?.data[AppLocaleKeys.error]) {
            case AppLocaleKeys.invalidUser:
              return emit(ForgotPasswordFailureState(
                  failure: AppLocaleKeys.userNotFound));

            default:
              return emit(ForgotPasswordFailureState(
                  failure: AppLocaleKeys.serverError));
          }
        } catch (e) {
          emit(ForgotPasswordFailureState(failure: e.toString()));
        }
      }
    });
  }
}
