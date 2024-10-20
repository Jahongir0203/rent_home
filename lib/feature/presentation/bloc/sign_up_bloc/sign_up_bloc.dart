import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:rent_home/core/usecases/usecases.dart';
import 'package:rent_home/feature/data/models/auth/request_register_model.dart';
import 'package:rent_home/feature/data/models/auth/response_register_model.dart';

import '../../../../core/error/failure.dart';
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

  late final RegisterUserUseCase userUseCase;

  SignUpBloc({required RegisterUserUseCase signUpUserUseCase})
      : super(SignUpInitialState()) {
    userUseCase = signUpUserUseCase;
    on<SignUpLoadedEvent>((event, emit) async {
      emit(SignUpLoadingState());
      final result = await userUseCase(
          RegisterParams(registerModel: event.requestRegisterModel));

      try {
        result.fold(
          (l) {
            emit(SignUpFailureState(failure: mapFailureToString(l)));
          },
          (r) {
            emit(SignUpSuccessState(responseRegisterModel: r));
          },
        );
      } catch (e) {
        emit(SignUpFailureState(failure: e.toString()));
      }
    });
    on<SignUpPasswordEvent>((event, emit) {
      emit(SignUpVisibilityState(
          isVisible1: event.isVisible1, isVisible2: event.isVisible2));
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
      return ("Unexpected error");
  }
}
