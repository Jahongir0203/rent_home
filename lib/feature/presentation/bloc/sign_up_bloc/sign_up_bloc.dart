import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:rent_home/core/usecases/usecases.dart';
import 'package:rent_home/core/utils/app_locale_keys.dart';
import 'package:rent_home/feature/data/models/auth/request_register_model.dart';
import 'package:rent_home/feature/data/models/auth/response_register_model.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/services/storage_service.dart';
import '../../../../injection_container.dart';
import '../../../domain/usecase/auth_usecase/register_user__use_case.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

const serverFailure = 'Server failure';
const cacheFailure = "Cache failure";
const invalidInputFailureMessage =
    "Invalid Input - The number must be a positive integer or zero";

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final storageService = sl<StorageService>();

  var maskFormatter = MaskTextInputFormatter(
    mask: '+998 ## ### ## ##',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );
  late final RegisterUserUseCase userUseCase;

  SignUpBloc({required RegisterUserUseCase signUpUserUseCase})
      : super(SignUpInitialState()) {
    userUseCase = signUpUserUseCase;
    on<SignUpLoadedEvent>((event, emit) async {
      emit(SignUpLoadingState());
      if (fullNameController.text.isEmpty &&
          emailController.text.isEmpty &&
          passwordController.text.isEmpty &&
          phoneNumberController.text.isEmpty &&
          confirmPasswordController.text.isEmpty) {
        emit(SignUpInputErrorState(
            fullName: AppLocaleKeys.fillField,
            phoneNumber: AppLocaleKeys.fillField,
            email: AppLocaleKeys.fillField,
            password: AppLocaleKeys.fillField,
            confirmPassword: AppLocaleKeys.fillField));
      } else if (fullNameController.text.isEmpty) {
        emit(SignUpInputErrorState(fullName: AppLocaleKeys.fillField));
      } else if (emailController.text.isEmpty &&
          passwordController.text.isEmpty &&
          phoneNumberController.text.isEmpty &&
          confirmPasswordController.text.isEmpty) {
        emit(SignUpInputErrorState(
            phoneNumber: AppLocaleKeys.fillField,
            email: AppLocaleKeys.fillField,
            password: AppLocaleKeys.fillField,
            confirmPassword: AppLocaleKeys.fillField));
      } else if (phoneNumberController.text.isEmpty) {
        emit(SignUpInputErrorState(phoneNumber: AppLocaleKeys.fillField));
      } else if (phoneNumberController.text.length < 17) {
        emit(SignUpInputErrorState(
            phoneNumber: AppLocaleKeys.enterFullPhoneNumber));
      } else if (![
        '20',
        '33',
        '55',
        '71',
        '77',
        '88',
        '90',
        '91',
        '93',
        '94',
        '95',
        '97',
        '98',
        '99'
      ].contains(phoneNumberController.text.substring(5, 7))) {
        emit(SignUpInputErrorState(phoneNumber: AppLocaleKeys.errorOperator));
      } else if (!emailController.text.contains(AppLocaleKeys.gmail)) {
        emit(SignUpInputErrorState(email: AppLocaleKeys.emailError));
      } else if (emailController.text.isEmpty &&
          passwordController.text.isEmpty &&
          confirmPasswordController.text.isEmpty) {
        emit(SignUpInputErrorState(
            email: AppLocaleKeys.fillField,
            password: AppLocaleKeys.fillField,
            confirmPassword: AppLocaleKeys.fillField));
      } else if (emailController.text.isEmpty) {
        emit(SignUpInputErrorState(email: AppLocaleKeys.fillField));
      } else if (!emailController.text.contains(AppLocaleKeys.gmail)) {
        emit(SignUpInputErrorState(email: AppLocaleKeys.emailError));
      } else if (passwordController.text.isEmpty &&
          confirmPasswordController.text.isEmpty) {
        emit(SignUpInputErrorState(
            password: AppLocaleKeys.fillField,
            confirmPassword: AppLocaleKeys.fillField));
      } else if (passwordController.text.isEmpty) {
        emit(SignUpInputErrorState(password: AppLocaleKeys.fillField));
      } else if (confirmPasswordController.text.isEmpty) {
        emit(SignUpInputErrorState(confirmPassword: AppLocaleKeys.fillField));
      } else if (passwordController.text.length < 6 &&
          confirmPasswordController.text.length < 6) {
        emit(SignUpInputErrorState(
            password: AppLocaleKeys.passwordError,
            confirmPassword: AppLocaleKeys.passwordError));
      } else if (passwordController.text != confirmPasswordController.text) {
        emit(SignUpInputErrorState(
            password: AppLocaleKeys.passwordNotSame,
            confirmPassword: AppLocaleKeys.passwordNotSame));
      } else {
        try {
          final result = await userUseCase(
              RegisterParams(registerModel: event.requestRegisterModel));
          result.fold(
            (l) {
              emit(SignUpFailureState(failure: mapFailureToString(l)));
            },
            (r) async {
              await storageService.putUserId(r.id);
              add(SignUpSuccessEvent(responseRegisterModel: r));
            },
          );
        } on DioException catch (e) {
          switch (e.response!.data[AppLocaleKeys.error]) {
            case AppLocaleKeys.dublicateEmail:
              return emit(
                  SignUpFailureState(failure: AppLocaleKeys.alreadyUsedEmail));
            case AppLocaleKeys.dublicatePhoneNumber:
              return emit(SignUpFailureState(
                  failure: AppLocaleKeys.alreadyUsedPhoneNumber));
            default:
              return emit(
                  SignUpFailureState(failure: AppLocaleKeys.serverError));
          }
        } catch (e) {
          emit(SignUpFailureState(failure: e.toString()));
        }
      }
    });
    on<SignUpPasswordEvent>((event, emit) {
      emit(SignUpVisibilityState(
          isVisible1: event.isVisible1, isVisible2: event.isVisible2));
    });
    on<SignUpSuccessEvent>((event, emit) {
      emit(SignUpSuccessState(
          responseRegisterModel: event.responseRegisterModel));
    });
  }
}

String mapFailureToString(Failure failure) {
  switch (failure.runtimeType) {
    case const (ServerFailure):
      return serverFailure;
    case const (CacheFailure):
      return cacheFailure;
    default:
      return (AppLocaleKeys.serverError);
  }
}
