import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:rent_home/core/usecases/usecases.dart';
import 'package:rent_home/core/utils/app_locale_keys.dart';
import 'package:rent_home/feature/data/models/auth/request_reset_password_model.dart';
import 'package:rent_home/feature/domain/usecase/auth_usecase/reset_password_use_case.dart';
import 'package:rent_home/feature/presentation/bloc/sign_up_bloc/sign_up_bloc.dart';

part 'reset_password_event.dart';

part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final TextEditingController codeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  late ResetPasswordUseCase resetPasswordUseCase;
  var maskFormatter = MaskTextInputFormatter(
    mask: '######',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );
  ResetPasswordBloc({required ResetPasswordUseCase useCase})
      : super(ResetPasswordInitialState()) {
    resetPasswordUseCase = useCase;
    on<ResetPasswordVisibilityEvent>((event, emit) {
      emit(ResetPasswordVisibilityState(isVisible: event.isVisible));
    });

    on<ResetPasswordLoadedEvent>((event, emit) async {
      if (codeController.text.isEmpty &&
          emailController.text.isEmpty &&
          newPasswordController.text.isEmpty) {
        emit(ResetPasswordInputErrorState(
            code: AppLocaleKeys.fillField,
            email: AppLocaleKeys.fillField,
            newPassword: AppLocaleKeys.fillField));
      } else if (codeController.text.isEmpty) {
        emit(ResetPasswordInputErrorState(code: AppLocaleKeys.fillField));
      } else if (emailController.text.isEmpty &&
          newPasswordController.text.isEmpty) {
        emit(ResetPasswordInputErrorState(
            email: AppLocaleKeys.fillField,
            newPassword: AppLocaleKeys.fillField));
      } else if (emailController.text.isEmpty) {
        emit(ResetPasswordInputErrorState(email: AppLocaleKeys.fillField));
      } else if (!emailController.text.contains(AppLocaleKeys.gmail)) {
        emit(ResetPasswordInputErrorState(email: AppLocaleKeys.emailError));
      } else if (newPasswordController.text.isEmpty) {
        emit(
            ResetPasswordInputErrorState(newPassword: AppLocaleKeys.fillField));
      } else if (newPasswordController.text.length < 6) {
        emit(ResetPasswordInputErrorState(
            newPassword: AppLocaleKeys.passwordError));
      } else {
        try {
          final response = await resetPasswordUseCase(ResetPasswordParams(
              resetPasswordModel: RequestResetPassword(
                  email: emailController.text,
                  code: codeController.text,
                  newPassword: newPasswordController.text)));
          response.fold(
            (l) =>
                emit(ResetPasswordFailureState(failure: mapFailureToString(l))),
            (r) => emit(ResetPasswordSuccessState(success: r)),
          );
        } on DioException catch (e) {
          switch (e.response?.statusCode) {
            case 401:
              return emit(ResetPasswordFailureState(
                  failure: AppLocaleKeys.unSendToEmail));
            default:
              return emit(ResetPasswordFailureState(
                  failure: AppLocaleKeys.serverError));
          }
        } catch (e) {
          emit(ResetPasswordFailureState(failure: e.toString()));
        }
      }
    });
  }
}
