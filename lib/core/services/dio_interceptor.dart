import 'package:dio/dio.dart';
import 'package:rent_home/core/services/storage_service.dart';
import 'package:rent_home/feature/data/models/auth/response_refresh_token_model.dart';

import '../../injection_container.dart';

class DioInterceptors extends Interceptor {
  final StorageService _storageService;
  final Dio _dio = sl<Dio>();

  DioInterceptors(this._storageService);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers.addAll({
      "Content-Type": "application/json",
    });
    String? token = await _storageService.getAccessToken();
    if (token != null) {
      options.headers.addAll({
        "Authorization": token,
      });
    }
    return super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 || err.response?.statusCode == 500) {
      await refreshToken();
      // Retry the request.
      try {
        handler.resolve(await _retry(err.requestOptions));
      } on DioException catch (e) {
        handler.next(e);
      }
      return;
    }
    handler.next(err);
  }

  Future<Response<dynamic>?> refreshToken() async {
    var refreshToken = await _storageService.getRefreshToken();
    print(refreshToken);
    var response = await _dio.post(
      "http://3.120.40.35:5555/auth/refresh-token",
      options: Options(headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json'
      }),
      data: {
        "refresh_token": refreshToken,
      },
    );
    print("AAA");
    print(response);
    if(response.statusCode==500){
      print("500");
    }

    if (response.statusCode == 200) {
      final result = ResponseRefreshTokenModel.fromJson(response.data);
      print(result);
      print("AAA");
      await _storageService.putRefreshToken(result.refreshToken);
      await _storageService.putAccessToken(result.accessToken);
      // print(UpdateTokenSuccess.fromJson(response.data).refreshToken);
      // _hiveRepository.saveRefreshToken(UpdateTokenSuccess.fromJson(response.data).refreshToken!);
      // _hiveRepository.saveAccessToken(UpdateTokenSuccess.fromJson(response.data).accessToken!);

      return response;
    }
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    String? token = await _storageService.getAccessToken();
    final options = Options(
      method: requestOptions.method,
      headers: {
        "Authorization": "$token",
      },
    );

    return _dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }
}
