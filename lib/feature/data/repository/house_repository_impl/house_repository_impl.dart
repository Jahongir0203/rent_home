import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:rent_home/core/error/failure.dart';
import 'package:rent_home/core/network/network_info.dart';
import 'package:rent_home/core/utils/app_locale_keys.dart';
import 'package:rent_home/feature/data/datasource/home_datasource/home_data_source.dart';

import 'package:rent_home/feature/data/models/house/delete_house_response.dart';

import 'package:rent_home/feature/data/models/house/get_houses_response.dart';

import 'package:rent_home/feature/data/models/house/post_house_request.dart';

import 'package:rent_home/feature/data/models/house/post_house_response.dart';

import 'package:rent_home/feature/data/models/house/put_house_request.dart';

import '../../../../core/error/exceptions.dart';
import '../../../domain/repository/house_repository/house_repository.dart';

class HouseRepositoryImpl extends HouseRepository {
  final NetworkInfo networkInfo;
  final HouseDataSource houseDataSource;

  HouseRepositoryImpl({
    required this.networkInfo,
    required this.houseDataSource,
  });

  @override
  Future<Either<Failure, DeleteHouseResponse>> deleteHouse(
      {required String id}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await houseDataSource.deleteHouse(id: id);
        return Right(result);
      } on ServerException catch (e) {
        return Left(ServerFailure(
            errorMessage: e.errorMessage, statusCode: e.statusCode.toInt()));
      } on DioException {
        return const Left(DioFailure());
      } on ParsingException catch (e) {
        return Left(ParsingFailure(errorMessage: e.errorMessage));
      }
    } else {
      return const Left(InternetFailure());
    }
  }

  @override
  Future<Either<Failure, House>> getHouseById({required String id}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await houseDataSource.getHouseByID(id: id);
        return Right(result);
      } on ServerException catch (e) {
        return Left(ServerFailure(
            errorMessage: e.errorMessage, statusCode: e.statusCode.toInt()));
      } on DioException {
        return const Left(DioFailure());
      } on ParsingException catch (e) {
        return Left(ParsingFailure(errorMessage: e.errorMessage));
      }
    } else {
      return const Left(InternetFailure());
    }
  }

  @override
  Future<Either<Failure, GetHousesResponse>> getHouses() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await houseDataSource.getHouses();
        return Right(result);
      } on ServerException catch (e) {
        return Left(ServerFailure(
            errorMessage: e.errorMessage, statusCode: e.statusCode.toInt()));
      } on DioException {
        return const Left(DioFailure());
      } on ParsingException catch (e) {
        return Left(ParsingFailure(errorMessage: e.errorMessage));
      }
    } else {
      return const Left(
          InternetFailure(errorMessage: AppLocaleKeys.noInternet));
    }
  }

  @override
  Future<Either<Failure, PostHouseResponse>> postHouse(
      {required PostHouseRequest postHouseRequest}) async {
    if (await networkInfo.isConnected) {
      try {
        final result =
            await houseDataSource.postHouse(postHouseRequest: postHouseRequest);
        return Right(result);
      } on ServerException catch (e) {
        return Left(ServerFailure(
            errorMessage: e.errorMessage, statusCode: e.statusCode.toInt()));
      } on DioException {
        return const Left(DioFailure());
      } on ParsingException catch (e) {
        return Left(ParsingFailure(errorMessage: e.errorMessage));
      }
    } else {
      return const Left(
          InternetFailure(errorMessage: AppLocaleKeys.noInternet));
    }
  }

  @override
  Future<Either<Failure, DeleteHouseResponse>> putHouse(
      {required PutHouseRequest putHouseRequest}) async {
    if (await networkInfo.isConnected) {
      try {
        final result =
            await houseDataSource.putHouse(putHouseRequest: putHouseRequest);
        return Right(result);
      } on ServerException catch (e) {
        return Left(ServerFailure(
            errorMessage: e.errorMessage, statusCode: e.statusCode.toInt()));
      } on DioException {
        return const Left(DioFailure());
      } on ParsingException catch (e) {
        return Left(ParsingFailure(errorMessage: e.errorMessage));
      }
    } else {
      return const Left(
          InternetFailure(errorMessage: AppLocaleKeys.noInternet));
    }
  }
}
