import 'package:dio/dio.dart';
import 'package:rent_home/core/error/exceptions.dart';
import 'package:rent_home/core/error/failure.dart';
import 'package:rent_home/core/utils/app_locale_keys.dart';
import 'package:rent_home/feature/data/models/auth/request_log_In_model.dart';
import 'package:rent_home/feature/data/models/auth/request_refresh_token_model.dart';
import 'package:rent_home/feature/data/models/auth/request_register_model.dart';
import 'package:rent_home/feature/data/models/auth/request_reset_password_model.dart';
import 'package:rent_home/feature/data/models/auth/request_validate_token_model.dart';
import 'package:rent_home/feature/data/models/auth/response_forgot_password_model.dart';
import 'package:rent_home/feature/data/models/auth/response_log_in_model.dart';
import 'package:rent_home/feature/data/models/auth/response_refresh_token_model.dart';
import 'package:rent_home/feature/data/models/auth/response_register_model.dart';

import '../../../../core/constants/constants.dart';

abstract class AuthDataSource {
  Future<ResponseRegisterModel> registerUser(
      {required RequestRegisterModel requestRegisterModel});

  Future<ResponseLogInModel> logInUser(
      {required RequestLogInModel requestLogInModel});

  Future<String> logOutUSer({required String email});

  Future<ResponseForgotPasswordModel> forgotPassword({required String email});

  Future<ResponseRefreshTokenModel> refreshToken(
      {required RequestRefreshTokenModel requestRefreshTokenModel});

  Future<String> resetPassword(
      {required RequestResetPassword resetPasswordModel});

  Future<String> validateToken(
      {required RequestValidateTokenModel requestValidateTokenModel});
}

class AuthDataSourceImpl extends AuthDataSource {
  final Dio _dio = Dio();

  @override
  Future<ResponseRegisterModel> registerUser(
      {required RequestRegisterModel requestRegisterModel}) {
    return _registerUser(
        requestRegisterModel, Constants.authUrl + Constants.register);
  }

  @override
  Future<ResponseLogInModel> logInUser(
      {required RequestLogInModel requestLogInModel}) {
    return _logInUser(requestLogInModel, Constants.authUrl + Constants.logIn);
  }

  @override
  Future<String> logOutUSer({required String email}) {
    return _logOutUser(email, Constants.authUrl + Constants.logOut);
  }

  @override
  Future<ResponseForgotPasswordModel> forgotPassword({required String email}) {
    return _forgotPassword(email, Constants.authUrl + Constants.forgotPassword);
  }

  @override
  Future<ResponseRefreshTokenModel> refreshToken(
      {required RequestRefreshTokenModel requestRefreshTokenModel}) {
    return _refreshToken(
        requestRefreshTokenModel, Constants.authUrl + Constants.refreshToken);
  }

  @override
  Future<String> resetPassword(
      {required RequestResetPassword resetPasswordModel}) {
    return _resetPassword(
        resetPasswordModel, Constants.authUrl + Constants.resetPassword);
  }

  @override
  Future<String> validateToken(
      {required RequestValidateTokenModel requestValidateTokenModel}) {
    return _validateToken(
        requestValidateTokenModel, Constants.authUrl + Constants.validateToken);
  }

  Future<ResponseRegisterModel> _registerUser(
      RequestRegisterModel requestRegisterModel, String url) async {
    var response = await _dio.post(
      url,
      data: requestRegisterModel.toJson(),
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
    if (response.statusCode == 200) {
      return ResponseRegisterModel.fromJson(response.data);
    } else {
      throw const ServerException(
          statusCode: 404, errorMessage: "Unexpected Error");
    }
  }

  Future<ResponseLogInModel> _logInUser(
      RequestLogInModel requestLogInModel, String url) async {
    var response = await _dio.post(
      url,
      data: requestLogInModel.toJson(),
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
    if (response.statusCode == 200) {
      return ResponseLogInModel.fromJson(response.data);
    } else {
      throw const ServerException(
          statusCode: 404, errorMessage: AppLocaleKeys.unexpectedError);
    }
  }

  Future<String> _logOutUser(String email, String url) async {
    var response = await _dio.post(
      url,
      queryParameters: {
        "email": email,
      },
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw const ServerException(
          statusCode: 404, errorMessage: AppLocaleKeys.unexpectedError);
    }
  }

  Future<ResponseForgotPasswordModel> _forgotPassword(
      String email, String url) async {
    var response = await _dio.post(
      url,
      queryParameters: {"email": email},
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
    if (response.statusCode == 200) {
      return ResponseForgotPasswordModel.fromJson(response.data);
    } else {
      throw const ServerFailure();
    }
  }

  Future<ResponseRefreshTokenModel> _refreshToken(
      RequestRefreshTokenModel requestRefreshTokenModel, String url) async {
    var response = await _dio.post(
      url,
      data: requestRefreshTokenModel.toJson(),
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    if (response.statusCode == 200) {
      return ResponseRefreshTokenModel.fromJson(response.data);
    } else {
      throw const ServerException(
          statusCode: 404, errorMessage: AppLocaleKeys.unexpectedError);
    }
  }

  Future<String> _resetPassword(
      RequestResetPassword requestResetPassword, String url) async {
    var response = await _dio.post(
      url,
      data: requestResetPassword.toJson(),
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw const ServerException(
          statusCode: 404, errorMessage: AppLocaleKeys.unexpectedError);
    }
  }

  Future<String> _validateToken(
      RequestValidateTokenModel requestValidateTokenModel, String url) async {
    var response = await _dio.post(
      url,
      data: requestValidateTokenModel.toJson(),
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw const ServerException(
          statusCode: 404, errorMessage: AppLocaleKeys.unexpectedError);
    }
  }
}
