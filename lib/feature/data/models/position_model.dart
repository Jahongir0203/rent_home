import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';

part 'position_model.g.dart';

@HiveType(typeId: 32) // Use a unique typeId for each model
class PositionModel extends HiveObject {
  @HiveField(0)
  final double latitude;

  @HiveField(1)
  final double longitude;

  PositionModel({
    required this.latitude,
    required this.longitude,
  });

  // Factory constructor to convert Position to PositionModel
  factory PositionModel.fromPosition(Position position) {
    return PositionModel(
      latitude: position.latitude,
      longitude: position.longitude,
    );
  }
}
