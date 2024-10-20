import 'package:dartz/dartz.dart';
import 'package:rent_home/core/error/failure.dart';
import 'package:rent_home/feature/data/models/auth/request_log_In_model.dart';
import 'package:rent_home/feature/data/models/auth/request_register_model.dart';
import 'package:rent_home/feature/data/models/auth/request_reset_password_model.dart';
import 'package:rent_home/feature/data/models/auth/request_validate_token_model.dart';
import 'package:rent_home/feature/data/models/auth/response_forgot_password_model.dart';
import 'package:rent_home/feature/data/models/auth/response_log_in_model.dart';
import 'package:rent_home/feature/data/models/auth/response_refresh_token_model.dart';

import '../../../data/models/auth/request_refresh_token_model.dart';
import '../../../data/models/auth/response_register_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, ResponseRegisterModel>> registerUser(
      {required RequestRegisterModel requestRegisterModel});

  Future<Either<Failure, ResponseLogInModel>> logInUser(
      {required RequestLogInModel requestLogInModel});

  Future<Either<Failure, ResponseForgotPasswordModel>> forgotPassword(
      {required String email});

  Future<Either<Failure, String>> logOut({required String email});

  Future<Either<Failure, ResponseRefreshTokenModel>> refreshToken(
      {required RequestRefreshTokenModel requestRefreshTokenModel});

  Future<Either<Failure, String>> resetPassword(
      {required RequestResetPassword requestResetPassword});

  Future<Either<Failure, String>> validateToken(
      {required RequestValidateTokenModel requestValidateTokenModel});
}
