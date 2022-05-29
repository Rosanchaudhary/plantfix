import 'dart:convert';
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:Plantfix/modals/custom_error.dart';
import 'package:Plantfix/modals/message.dart';
import 'package:http/http.dart' as http;

class MessageRepository {
  Future<List<Message>> getMessages(String discussionId) async {
    try {
      final storage = new FlutterSecureStorage();
      String? value = await storage.read(key: "x-auth-token");
      String token = "Bearer " + value!;

      final response = await http.get(
          Uri.parse(
              'https://plantfixapp.herokuapp.com/discussion/$discussionId/messages/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            HttpHeaders.authorizationHeader: token
          });

      var tagObjsJson = jsonDecode(response.body) as List;
      List<Message> tagObjs =
          tagObjsJson.map((tagJson) => Message.fromJson(tagJson)).toList();

      return tagObjs;
    } catch (e) {
      throw CustomError(code: 'Exception', message: e.toString());
    }
  }

  Future<Message> sendMessages(String discussionId, String message) async {
    try {
      final storage = new FlutterSecureStorage();
      String? value = await storage.read(key: "x-auth-token");
      String token = "Bearer " + value!;

      final response = await http.post(
          Uri.parse(
              'https://plantfixapp.herokuapp.com/discussion/$discussionId/message-create/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            HttpHeaders.authorizationHeader: token
          },
          body: jsonEncode(<String, String>{
            "message": message,
          }));

      final resmessage = Message.fromJson(jsonDecode(response.body));
      return resmessage;
    } catch (e) {
      throw CustomError(code: 'Exception', message: e.toString());
    }
  }
}
