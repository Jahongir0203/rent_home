class PostHouseResponse {
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
  int? roommateCount;
  String? leaseTerms;
  int? leaseDuration;
  bool? topStatus;
  List<String>? imageUrl;
  String? createdAt;
  String? updatedAt;
  int? latitude;
  int? longitude;

  PostHouseResponse(
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
      this.roommateCount,
      this.leaseTerms,
      this.leaseDuration,
      this.topStatus,
      this.imageUrl,
      this.createdAt,
      this.updatedAt,
      this.latitude,
      this.longitude});

  PostHouseResponse.fromJson(Map<String, dynamic> json) {
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
    roommateCount = json['roommate_count'];
    leaseTerms = json['lease_terms'];
    leaseDuration = json['lease_duration'];
    topStatus = json['top_status'];
    imageUrl = json['image_url'].cast<String>();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    latitude = json['latitude'];
    longitude = json['longitude'];
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
    data['roommate_count'] = roommateCount;
    data['lease_terms'] = leaseTerms;
    data['lease_duration'] = leaseDuration;
    data['top_status'] = topStatus;
    data['image_url'] = imageUrl;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}
