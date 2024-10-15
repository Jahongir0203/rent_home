class AppConstantas {
  static const String baseUrl = "http://3.120.40.35:5555/";
  static RegExp emailRegEx = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
  static RegExp passwordRegEx = RegExp(r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$");
  static RegExp phoneRegEx = RegExp(r"^\+?[0-9]{10,15}$");
}
