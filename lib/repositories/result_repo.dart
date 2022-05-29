import 'dart:convert';

import 'package:Plantfix/modals/result_model.dart';
import 'package:http/http.dart' as http;

class ResultRepository {
  Future<Result> getResult(String id) async {
    var testID = int.parse(id) + 4;
    String idd = testID.toString();

    try {
      final response = await http.get(
          Uri.parse('https://plantfixapp.herokuapp.com/disease/${idd}/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });

      return Result.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw Exception('Failed to load result');
    }
  }
}
