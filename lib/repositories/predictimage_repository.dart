import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:Plantfix/modals/prediction_modal.dart';

class PredictImageRepository {
  Future<String> predictImage(File file) async {
    var request = http.MultipartRequest("POST",
        Uri.parse("https://plantfixapp.herokuapp.com/mldeploy/predict/"));
    //add text fields
    //  request.fields["text_field"] = text;
    //create multipart using filepath, string or bytes
    var pic = await http.MultipartFile.fromPath("image", file.path);
    //add multipart to request
    request.files.add(pic);
    var response = await request.send();

    //Get the response from the server
    var responseData = await response.stream.toBytes();

    var responseString = String.fromCharCodes(responseData);
    Predict prediction = Predict.fromJson(jsonDecode(responseString));

    return prediction.index;
  }
}
