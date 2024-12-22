class ErrorModel {
  String? code;
  String? detail;

  ErrorModel(this.code, this.detail);

  ErrorModel.fromJson(
    Map<String, dynamic> json,
  ) {
    code = json['code'];
    detail = json['detail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['detail'] = detail;
    return data;
  }
}
