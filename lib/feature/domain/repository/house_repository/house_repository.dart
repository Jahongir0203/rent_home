import 'package:dartz/dartz.dart';
import 'package:rent_home/core/error/failure.dart';
import 'package:rent_home/feature/data/models/house/delete_house_response.dart';
import 'package:rent_home/feature/data/models/house/get_houses_response.dart';
import 'package:rent_home/feature/data/models/house/post_house_response.dart';

import '../../../data/models/house/post_house_request.dart';
import '../../../data/models/house/put_house_request.dart';

abstract class HouseRepository {
  Future<Either<Failure, GetHousesResponse>> getHouses();

  Future<Either<Failure, PostHouseResponse>> postHouse(
      {required PostHouseRequest postHouseRequest});

  Future<Either<Failure, DeleteHouseResponse>> deleteHouse(
      {required String id});

  Future<Either<Failure, House>> getHouseById({required String id});

  Future<Either<Failure, DeleteHouseResponse>> putHouse(
      {required PutHouseRequest putHouseRequest});
}
