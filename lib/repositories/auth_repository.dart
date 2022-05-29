import 'dart:convert';
import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:Plantfix/modals/custom_error.dart';
import 'package:Plantfix/modals/profile_model.dart';
import 'package:Plantfix/modals/registration_res.dart';

class AuthRepository {
  Future<void> authenticateUser(
      String username, String email, String password, String password2) async {
    try {
      final http.Response response = await http.post(
          Uri.parse('https://plantfixapp.herokuapp.com/account/register/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          },
          body: jsonEncode(<String, String>{
            "username": username,
            "email": email,
            "password": password,
            "password2": password2
          }));
      final regres = RegistrationResponse.fromJson(jsonDecode(response.body));

      final storage = new FlutterSecureStorage();
      await storage.write(key: "x-auth-token", value: regres.token.access);
    } catch (e) {
      throw CustomError(code: 'Exception', message: e.toString());
    }
  }

  Future<String> signup(
      String username, String email, String password, String password2) async {
    try {
      final http.Response response = await http.post(
          Uri.parse('https://plantfixapp.herokuapp.com/account/signup/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          },
          body: jsonEncode(<String, String>{
            "username": username,
            "email": email,
            "password": password,
            "password2": password2
          }));
      final regres = jsonDecode(response.body);
      return regres['newuser'].toString();
    } catch (e) {
      throw CustomError(code: 'Exception', message: e.toString());
    }
  }

  Future<void> verifyuser(String otp, String pk) async {
    try {
      final http.Response response = await http.post(
          Uri.parse('https://plantfixapp.herokuapp.com/account/verifyuser/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          },
          body: jsonEncode(<String, String>{"otp": otp, "user": pk}));

      final regres = RegistrationResponse.fromJson(jsonDecode(response.body));
      final storage = new FlutterSecureStorage();
      await storage.write(key: "x-auth-token", value: regres.token.access);
    } catch (e) {
      throw CustomError(code: 'Exception', message: e.toString());
    }
  }

  Future<void> loginUser(String username, String password) async {
    try {
      final http.Response response = await http.post(
          Uri.parse('https://plantfixapp.herokuapp.com/account/api/token/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          },
          body: jsonEncode(
              <String, String>{"username": username, "password": password}));
      if (response.statusCode != 200) {
        final regress = jsonDecode(response.body);
        throw Exception(regress['detail']);
      }

      final regres = jsonDecode(response.body);
      final storage = new FlutterSecureStorage();
      await storage.write(key: "x-auth-token", value: regres['access']);
    } catch (e) {
      throw CustomError(code: 'Exception', message: e.toString());
    }
  }

  Future<Profile> getUserData() async {
    try {
      final storage = new FlutterSecureStorage();
      String? value = await storage.read(key: "x-auth-token");
      String token = "Bearer " + value!;
      final http.Response response = await http.get(
          Uri.parse('https://plantfixapp.herokuapp.com/account/getuser'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            HttpHeaders.authorizationHeader: token
          });
      if (response.statusCode != 201) {
        final regress = jsonDecode(response.body);
        throw Exception(regress['detail']);
      }
      final regres = Profile.fromJson(jsonDecode(response.body));
      return regres;
    } catch (e) {
      throw CustomError(code: 'Exception', message: e.toString());
    }
  }
}
