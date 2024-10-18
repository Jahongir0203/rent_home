class RequestRegisterModel {
  String? confirmPassword;
  String? email;
  String? fullName;
  String? password;
  String? phoneNumber;

  RequestRegisterModel(
      {this.confirmPassword,
        this.email,
        this.fullName,
        this.password,
        this.phoneNumber});

  RequestRegisterModel.fromJson(Map<String, dynamic> json) {
    confirmPassword = json['confirm_password'];
    email = json['email'];
    fullName = json['full_name'];
    password = json['password'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['confirm_password'] = confirmPassword;
    data['email'] = email;
    data['full_name'] = fullName;
    data['password'] = password;
    data['phone_number'] = phoneNumber;
    return data;
  }
}