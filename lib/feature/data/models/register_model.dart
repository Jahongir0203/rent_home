class RegisterModel {
  final String confirmPassword;
  final String email;
  final String fullName;
  final String password;
  final String phoneNumber;
  RegisterModel({
    required this.confirmPassword,
    required this.email,
    required this.fullName,
    required this.password,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      "confirm_password": confirmPassword,
      "email": email,
      "full_name": fullName,
      "password": password,
      "phone_number": phoneNumber,
    };
  }
}
