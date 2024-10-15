import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rent_home/core/constantas/app_constantas.dart';
import 'package:rent_home/feature/data/models/register_model.dart';

class ApiProvider {
  static Future<void> getRegister(RegisterModel register) async {
    String url = "${AppConstantas.baseUrl}auth/register";
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(register.toJson()),
      );
      if (response.statusCode != 200) {
        throw Exception("Field to register user: ${response.body}");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
