class RequestRefreshTokenModel {
  String? refreshToken;

  RequestRefreshTokenModel({this.refreshToken});

  RequestRefreshTokenModel.fromJson(Map<String, dynamic> json) {
    refreshToken = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['refresh_token'] = refreshToken;
    return data;
  }
}