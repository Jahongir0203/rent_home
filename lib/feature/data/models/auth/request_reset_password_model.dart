class RequestResetPassword {
  String? code;
  String? email;
  String? newPassword;

  RequestResetPassword({this.code, this.email, this.newPassword});

  RequestResetPassword.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    email = json['email'];
    newPassword = json['new_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['email'] = email;
    data['new_password'] = newPassword;
    return data;
  }
}
