import 'package:hive/hive.dart';

part 'house_model.g.dart'; // This is the generated part file, it will be created by build_runner.
@HiveType(typeId: 0)
class HouseTypeModel extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? ownerId;

  @HiveField(2)
  String? address;

  @HiveField(3)
  int? price;

  @HiveField(4)
  String? propertyType;

  @HiveField(5)
  int? bedrooms;

  @HiveField(6)
  int? bathrooms;

  @HiveField(7)
  int? squareFootage;

  @HiveField(8)
  String? listingStatus;

  @HiveField(9)
  String? description;

  @HiveField(10)
  String? leaseTerms;

  @HiveField(11)
  int? leaseDuration;

  @HiveField(12)
  bool? topStatus;

  @HiveField(13)
  List<String>? imageUrl;

  @HiveField(14)
  String? createdAt;

  @HiveField(15)
  String? updatedAt;

  @HiveField(16)
  num? latitude;

  @HiveField(17)
  double? longitude;

  @HiveField(18)
  int? roommateCount;

  HouseTypeModel({
    this.id,
    this.ownerId,
    this.address,
    this.price,
    this.propertyType,
    this.bedrooms,
    this.bathrooms,
    this.squareFootage,
    this.listingStatus,
    this.description,
    this.leaseTerms,
    this.leaseDuration,
    this.topStatus,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
    this.latitude,
    this.longitude,
    this.roommateCount,
  });

  /// Factory constructor to create an instance from a JSON map
  factory HouseTypeModel.fromJson(Map<String, dynamic> json) {
    return HouseTypeModel(
      id: json['id'] as String?,
      ownerId: json['ownerId'] as String?,
      address: json['address'] as String?,
      price: json['price'] as int?,
      propertyType: json['propertyType'] as String?,
      bedrooms: json['bedrooms'] as int?,
      bathrooms: json['bathrooms'] as int?,
      squareFootage: json['squareFootage'] as int?,
      listingStatus: json['listingStatus'] as String?,
      description: json['description'] as String?,
      leaseTerms: json['leaseTerms'] as String?,
      leaseDuration: json['leaseDuration'] as int?,
      topStatus: json['topStatus'] as bool?,
      imageUrl: (json['imageUrl'] as List<dynamic>?)?.cast<String>(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      latitude: json['latitude'] as num?,
      longitude: (json['longitude'] as num?)?.toDouble(),
      roommateCount: json['roommateCount'] as int?,
    );
  }

  /// Converts the instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ownerId': ownerId,
      'address': address,
      'price': price,
      'propertyType': propertyType,
      'bedrooms': bedrooms,
      'bathrooms': bathrooms,
      'squareFootage': squareFootage,
      'listingStatus': listingStatus,
      'description': description,
      'leaseTerms': leaseTerms,
      'leaseDuration': leaseDuration,
      'topStatus': topStatus,
      'imageUrl': imageUrl,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'latitude': latitude,
      'longitude': longitude,
      'roommateCount': roommateCount,
    };
  }
}

