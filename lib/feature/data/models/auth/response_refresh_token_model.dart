class ResponseRefreshTokenModel {
  String? accessToken;
  String? refreshToken;

  ResponseRefreshTokenModel({this.accessToken, this.refreshToken});

  ResponseRefreshTokenModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['refresh_token'] = refreshToken;
    return data;
  }
}
