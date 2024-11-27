import 'package:dio/dio.dart';
import 'package:rent_home/core/constants/constants.dart';
import 'package:rent_home/core/error/exceptions.dart';
import 'package:rent_home/core/services/dio_interceptor.dart';
import 'package:rent_home/core/services/storage_service.dart';
import 'package:rent_home/feature/data/models/error_model.dart';
import 'package:rent_home/feature/data/models/house/delete_house_response.dart';
import 'package:rent_home/feature/data/models/house/get_houses_response.dart';
import 'package:rent_home/feature/data/models/house/post_house_response.dart';

import '../../../../injection_container.dart';
import '../../models/house/post_house_request.dart';
import '../../models/house/put_house_request.dart';

abstract class HouseDataSource {
  Future<GetHousesResponse> getHouses();

  Future<House> getHouseByID({required String id});

  Future<DeleteHouseResponse> deleteHouse({required String id});

  Future<PostHouseResponse> postHouse(
      {required PostHouseRequest postHouseRequest});

  Future<DeleteHouseResponse> putHouse(
      {required PutHouseRequest putHouseRequest});
}

class HouseDataSourceImpl extends HouseDataSource {
  StorageService storageService = sl<StorageService>();
  final Dio _dio = sl<Dio>()
    ..interceptors.add(DioInterceptors(sl<StorageService>()));

  /// Delete House
  @override
  Future<DeleteHouseResponse> deleteHouse({required String id}) async {
    try {
      final response = await _dio.delete(
        Constants.baseUrl + Constants.deleteHouse + id,
        options: Options(
          headers: {
            "Authorization": await storageService.getAccessToken(),
            'accept': "application/json",
            'Content-Type': "application/json"
          },
        ),
      );
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return DeleteHouseResponse.fromJson(response.data);
      }
      if (response is Map<String, dynamic>) {
        final error = ErrorModel.fromJson(response.data);
        throw ServerException(
            statusCode: response.statusCode ?? 500,
            errorMessage: error.detail.toString());
      } else {
        throw ServerException(
            statusCode: response.statusCode ?? 500,
            errorMessage: response.data.toString());
      }
    } on ServerException {
      rethrow;
    } on DioException {
      rethrow;
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  /// Get House By ID
  @override
  Future<House> getHouseByID({required String id}) async {
    try {
      final response = await _dio.get(
        Constants.baseUrl + Constants.getHouseById + id,
        options: Options(
          headers: {
            "Authorization": await storageService.getAccessToken(),
            'accept': "application/json",
            'Content-Type': "application/json"
          },
        ),
      );
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return House.fromJson(response.data);
      }
      if (response is Map<String, dynamic>) {
        final error = ErrorModel.fromJson(response.data);
        throw ServerException(
            statusCode: response.statusCode ?? 500,
            errorMessage: error.detail.toString());
      } else {
        throw ServerException(
            statusCode: response.statusCode ?? 500,
            errorMessage: response.data.toString());
      }
    } on ServerException {
      rethrow;
    } on DioException {
      rethrow;
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  /// Get Houses
  @override
  Future<GetHousesResponse> getHouses() async {
    try {
      final response = await _dio.get(
        Constants.baseUrl + Constants.getHouse,
        options: Options(
          headers: {
            "Authorization": await storageService.getAccessToken(),
            'accept': "application/json",
            'Content-Type': "application/json"
          },
        ),
      );
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return GetHousesResponse.fromJson(response.data);
      }
      if (response is Map<String, dynamic>) {
        final error = ErrorModel.fromJson(response.data);
        throw ServerException(
            statusCode: response.statusCode ?? 500,
            errorMessage: error.detail.toString());
      } else {
        throw ServerException(
            statusCode: response.statusCode ?? 500,
            errorMessage: response.data.toString());
      }
    } on ServerException {
      rethrow;
    } on DioException {
      rethrow;
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  /// Create House Post
  @override
  Future<PostHouseResponse> postHouse(
      {required PostHouseRequest postHouseRequest}) async {
    try {
      final data = postHouseRequest.toJson();
      final response = await _dio.post(
        Constants.baseUrl + Constants.createHouse,
        data: data,
        options: Options(
          headers: {
            "Authorization": await storageService.getAccessToken(),
            'accept': "application/json",
            'Content-Type': "application/json"
          },
        ),
      );
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return PostHouseResponse.fromJson(response.data);
      }
      if (response is Map<String, dynamic>) {
        final error = ErrorModel.fromJson(response.data);
        throw ServerException(
            statusCode: response.statusCode ?? 500,
            errorMessage: error.detail.toString());
      } else {
        throw ServerException(
            statusCode: response.statusCode ?? 500,
            errorMessage: response.data.toString());
      }
    } on ServerException {
      rethrow;
    } on DioException {
      rethrow;
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  ///Put House Update House
  @override
  Future<DeleteHouseResponse> putHouse(
      {required PutHouseRequest putHouseRequest}) async {
    try {
      final data = putHouseRequest.toJson();
      final response = await _dio.put(
        Constants.baseUrl + Constants.updateHouse,
        data: data,
        options: Options(
          headers: {
            "Authorization": await storageService.getAccessToken(),
            'accept': "application/json",
            'Content-Type': "application/json"
          },
        ),
      );
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return DeleteHouseResponse.fromJson(response.data);
      }
      if (response is Map<String, dynamic>) {
        final error = ErrorModel.fromJson(response.data);
        throw ServerException(
            statusCode: response.statusCode ?? 500,
            errorMessage: error.detail.toString());
      } else {
        throw ServerException(
            statusCode: response.statusCode ?? 500,
            errorMessage: response.data.toString());
      }
    } on ServerException {
      rethrow;
    } on DioException {
      rethrow;
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }
}
