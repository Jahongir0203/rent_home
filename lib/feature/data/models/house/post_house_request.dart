class PostHouseRequest {
  String? address;
  int? bathrooms;
  int? bedrooms;
  String? description;
  List<String>? imageUrl;
  int? latitude;
  int? leaseDuration;
  String? leaseTerms;
  String? listingStatus;
  int? longitude;
  int? price;
  String? propertyType;
  int? roommateCount;
  int? squareFootage;
  bool? topStatus;

  PostHouseRequest(
      {this.address,
        this.bathrooms,
        this.bedrooms,
        this.description,
        this.imageUrl,
        this.latitude,
        this.leaseDuration,
        this.leaseTerms,
        this.listingStatus,
        this.longitude,
        this.price,
        this.propertyType,
        this.roommateCount,
        this.squareFootage,
        this.topStatus});

  PostHouseRequest.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    bathrooms = json['bathrooms'];
    bedrooms = json['bedrooms'];
    description = json['description'];
    imageUrl = json['image_url'].cast<String>();
    latitude = json['latitude'];
    leaseDuration = json['lease_duration'];
    leaseTerms = json['lease_terms'];
    listingStatus = json['listing_status'];
    longitude = json['longitude'];
    price = json['price'];
    propertyType = json['property_type'];
    roommateCount = json['roommate_count'];
    squareFootage = json['square_footage'];
    topStatus = json['top_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['bathrooms'] = bathrooms;
    data['bedrooms'] = bedrooms;
    data['description'] = description;
    data['image_url'] = imageUrl;
    data['latitude'] = latitude;
    data['lease_duration'] = leaseDuration;
    data['lease_terms'] = leaseTerms;
    data['listing_status'] = listingStatus;
    data['longitude'] = longitude;
    data['price'] = price;
    data['property_type'] = propertyType;
    data['roommate_count'] = roommateCount;
    data['square_footage'] = squareFootage;
    data['top_status'] = topStatus;
    return data;
  }
}