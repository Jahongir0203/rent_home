import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:rent_home/feature/data/models/auth/request_log_In_model.dart';
import 'package:rent_home/feature/data/models/auth/request_refresh_token_model.dart';
import 'package:rent_home/feature/data/models/auth/request_register_model.dart';
import 'package:rent_home/feature/data/models/auth/request_reset_password_model.dart';
import 'package:rent_home/feature/data/models/auth/request_validate_token_model.dart';

import '../error/failure.dart';

abstract class Usecases<Type, Params> {
  Future<Either<Failure, Type>> call(Params prams);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

class Params extends Equatable {
  final int number;

  const Params({required this.number});

  @override
  List<Object?> get props => [number];
}

class RegisterParams extends Equatable {
  final RequestRegisterModel registerModel;

  const RegisterParams({required this.registerModel});

  @override
  List<Object?> get props => [registerModel];
}

class ForgotPasswordPrams extends Equatable {
  final String email;

  const ForgotPasswordPrams({required this.email});

  @override
  List<Object?> get props => [email];
}

class LogInParams extends Equatable {
  final RequestLogInModel logInModel;

  const LogInParams({required this.logInModel});

  @override
  List<Object?> get props => [logInModel];
}

class LogOutParams extends Equatable {
  final String email;

  const LogOutParams({required this.email});

  @override
  List<Object?> get props => [email];
}

class RefreshTokenParams extends Equatable {
  final RequestRefreshTokenModel refreshTokenModel;

  const RefreshTokenParams({required this.refreshTokenModel});

  @override
  List<Object?> get props => [refreshTokenModel];
}

class ResetPasswordParams extends Equatable {
  final RequestResetPassword resetPasswordModel;

  const ResetPasswordParams({required this.resetPasswordModel});

  @override
  List<Object?> get props => [resetPasswordModel];
}

class ValidateTokenParams extends Equatable {
  final RequestValidateTokenModel validateTokenModel;

  const ValidateTokenParams({required this.validateTokenModel});

  @override
  List<Object?> get props => [validateTokenModel];
}
