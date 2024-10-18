import 'package:dartz/dartz.dart';
import 'package:rent_home/core/error/failure.dart';
import 'package:rent_home/feature/data/models/auth/response_forgot_password_model.dart';
import 'package:rent_home/feature/data/models/auth/response_log_in_model.dart';
import 'package:rent_home/feature/data/models/auth/response_refresh_token_model.dart';

import '../../../data/models/auth/response_register_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, ResponseRegisterModel>> registerUser();

  Future<Either<Failure, ResponseLogInModel>> logInUser();

  Future<Either<Failure, ResponseForgotPasswordModel>> forgotPassword(
      {String email});

  Future<Either<Failure, String>> logOut({String email});

  Future<Either<Failure, ResponseRefreshTokenModel>> refreshToken(
      {String refreshToken});
}
