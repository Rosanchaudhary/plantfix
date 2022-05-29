import 'dart:convert';
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:Plantfix/modals/custom_error.dart';
import 'package:Plantfix/modals/discussion.dart';

class AskCommunityRepository {
  Future<void> askCommunity(String image, String title, String about) async {
    try {
      final storage = new FlutterSecureStorage();
      String? value = await storage.read(key: "x-auth-token");
      String token = "Bearer " + value!;
      var filename = image;
      var url = 'https://plantfixapp.herokuapp.com/discussion/list/';
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
          url,
        ),
      );

      request.files.add(http.MultipartFile('image',
          File(filename).readAsBytes().asStream(), File(filename).lengthSync(),
          filename: filename.split('/').last));

      request.fields["name"] = title;
      request.fields["about"] = about;
      final newEntries = <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: token
      };

      request.headers.addAll(newEntries);

      await request.send();
    } catch (e) {
      throw CustomError(code: 'Exception', message: "Login Required");
    }
  }

  Future<List<Discussion>> getDiscussions() async {
    try {
      final response = await http.get(
          Uri.parse('https://plantfixapp.herokuapp.com/discussion/list/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      var tagObjsJson = jsonDecode(response.body) as List;
      List<Discussion> tagObjs =
          tagObjsJson.map((tagJson) => Discussion.fromJson(tagJson)).toList();

      return tagObjs;
    } catch (e) {
      throw CustomError(code: 'Exception', message: e.toString());
    }
  }
}

      // await http.post(
      //     Uri.parse('https://plantfixapp.herokuapp.com/discussion/list/'),
      //     headers: <String, String>{
      //       'Content-Type': 'application/json; charset=UTF-8',
      //       HttpHeaders.authorizationHeader: token
      //     },
      //     body: jsonEncode(<String, String>{"name": title, "about": about}));
