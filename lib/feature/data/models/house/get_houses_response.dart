class GetHousesResponse {
  List<House>? house;

  GetHousesResponse({this.house});

  GetHousesResponse.fromJson(Map<String, dynamic> json) {
    if (json['house'] != null) {
      house = <House>[];
      json['house'].forEach((v) {
        house!.add(House.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (house != null) {
      data['house'] = house!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class House {
  String? id;
  String? ownerId;
  String? address;
  int? price;
  String? propertyType;
  int? bedrooms;
  int? bathrooms;
  int? squareFootage;
  String? listingStatus;
  String? description;
  String? leaseTerms;
  int? leaseDuration;
  bool? topStatus;
  List<String>? imageUrl;
  String? createdAt;
  String? updatedAt;
  num? latitude;
  double? longitude;
  int? roommateCount;

  House(
      {this.id,
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
      this.roommateCount});

  House.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ownerId = json['owner_id'];
    address = json['address'];
    price = json['price'];
    propertyType = json['property_type'];
    bedrooms = json['bedrooms'];
    bathrooms = json['bathrooms'];
    squareFootage = json['square_footage'];
    listingStatus = json['listing_status'];
    description = json['description'];
    leaseTerms = json['lease_terms'];
    leaseDuration = json['lease_duration'];
    topStatus = json['top_status'];
    imageUrl = json['image_url'].cast<String>();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    roommateCount = json['roommate_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['owner_id'] = ownerId;
    data['address'] = address;
    data['price'] = price;
    data['property_type'] = propertyType;
    data['bedrooms'] = bedrooms;
    data['bathrooms'] = bathrooms;
    data['square_footage'] = squareFootage;
    data['listing_status'] = listingStatus;
    data['description'] = description;
    data['lease_terms'] = leaseTerms;
    data['lease_duration'] = leaseDuration;
    data['top_status'] = topStatus;
    data['image_url'] = imageUrl;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['roommate_count'] = roommateCount;
    return data;
  }
}
