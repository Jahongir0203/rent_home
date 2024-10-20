import 'package:dartz/dartz.dart';
import 'package:rent_home/core/error/exceptions.dart';
import 'package:rent_home/core/error/failure.dart';
import 'package:rent_home/core/network/network_info.dart';
import 'package:rent_home/core/utils/app_locale_keys.dart';
import 'package:rent_home/feature/data/datasource/auth_datasource/auth_data_source.dart';
import 'package:rent_home/feature/data/models/auth/request_log_In_model.dart';
import 'package:rent_home/feature/data/models/auth/request_register_model.dart';
import 'package:rent_home/feature/data/models/auth/request_reset_password_model.dart';
import 'package:rent_home/feature/data/models/auth/request_validate_token_model.dart';
import 'package:rent_home/feature/data/models/auth/response_forgot_password_model.dart';
import 'package:rent_home/feature/data/models/auth/response_log_in_model.dart';
import 'package:rent_home/feature/data/models/auth/response_refresh_token_model.dart';
import 'package:rent_home/feature/data/models/auth/response_register_model.dart';
import 'package:rent_home/feature/domain/repository/auth_repository/auth_repository.dart';

import '../../models/auth/request_refresh_token_model.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDataSource authDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({required this.authDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, ResponseForgotPasswordModel>> forgotPassword(
      {required String email}) async {
    if (await networkInfo.isConnected) {
      try {
        final user = await authDataSource.forgotPassword(email: email);
        return Right(user);
      } on ServerException {
        return Left(ServiceFailure());
      }
    } else {
      return Left(ServiceFailure(message: AppLocaleKeys.noInternet));
    }
  }

  @override
  Future<Either<Failure, ResponseLogInModel>> logInUser(
      {required RequestLogInModel requestLogInModel}) async {
    if (await networkInfo.isConnected) {
      try {
        final logInRes = await authDataSource.logInUser(
            requestLogInModel: requestLogInModel);
        return Right(logInRes);
      } on ServerException {
        return Left(ServiceFailure());
      }
    } else {
      return Left(ServiceFailure(message: AppLocaleKeys.noInternet));
    }
  }

  @override
  Future<Either<Failure, String>> logOut({required String email}) async {
    if (await networkInfo.isConnected) {
      try {
        final logOutRes = await authDataSource.logOutUSer(email: email);
        return Right(logOutRes);
      } on ServerException {
        return Left(ServiceFailure());
      }
    } else {
      return Left(ServiceFailure(message: AppLocaleKeys.noInternet));
    }
  }

  @override
  Future<Either<Failure, ResponseRefreshTokenModel>> refreshToken(
      {required RequestRefreshTokenModel requestRefreshTokenModel}) async {
    if (await networkInfo.isConnected) {
      try {
        final refreshTokenRes = await authDataSource.refreshToken(
            requestRefreshTokenModel: requestRefreshTokenModel);
        return Right(refreshTokenRes);
      } on ServerException {
        return Left(ServiceFailure());
      }
    } else {
      return Left(ServiceFailure(message: AppLocaleKeys.noInternet));
    }
  }

  @override
  Future<Either<Failure, ResponseRegisterModel>> registerUser(
      {required RequestRegisterModel requestRegisterModel}) async {
    if (await networkInfo.isConnected) {
      try {
        final registerUserRes = await authDataSource.registerUser(
            requestRegisterModel: requestRegisterModel);
        return Right(registerUserRes);
      } on ServerException {
        return Left(ServiceFailure());
      }
    } else {
      return Left(ServiceFailure(message: AppLocaleKeys.noInternet));
    }
  }

  @override
  Future<Either<Failure, String>> resetPassword(
      {required RequestResetPassword requestResetPassword}) async {
    if (await networkInfo.isConnected) {
      try {
        final resetPasswordRes = await authDataSource.resetPassword(
            resetPasswordModel: requestResetPassword);
        return Right(resetPasswordRes);
      } on ServerException {
        return Left(ServiceFailure());
      }
    } else {
      return Left(ServiceFailure(message: AppLocaleKeys.noInternet));
    }
  }

  @override
  Future<Either<Failure, String>> validateToken(
      {required RequestValidateTokenModel requestValidateTokenModel}) async {
    if (await networkInfo.isConnected) {
      try {
        final validateTokenRes = await authDataSource.validateToken(
            requestValidateTokenModel: requestValidateTokenModel);
        return Right(validateTokenRes);
      } on ServerException {
        return Left(ServiceFailure());
      }
    } else {
      return Left(ServiceFailure(message: AppLocaleKeys.noInternet));
    }
  }
}
