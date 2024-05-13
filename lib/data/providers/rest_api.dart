import 'dart:convert';
import 'package:structure/utils/my_material.dart';
import 'package:http/http.dart' as http;

class RestApi {

  String headerToken;

  RestApi({this.headerToken = ''});

  Future<http.Response?> getDataFromServer(String url, Map<String,dynamic> mapParams, {HttpMethod method = HttpMethod.post,
    List<Map<String,dynamic>>? listParams, Map<String,String>? customHeaders}) async {
    http.Response? response;

    var params = listParams?? mapParams;
    Map<String, String> mapHeaders = {
      "Content-Type": "application/json",
    };

    if (headerToken.isNotEmpty) {
      mapHeaders['Authorization'] = 'Bearer $headerToken';
    }

    if (customHeaders != null) {
      mapHeaders.addAll(customHeaders);
    }

    Uri uri = Uri.parse(url);
    String body = jsonEncode(params);

    try{
      //debugPrint('===$mapHeaders====$url====$method===${jsonEncode(params)}');

      if (method == HttpMethod.post) {
        response = await http.post(uri, headers: mapHeaders, body: body,);
      }
      else if (method == HttpMethod.put) {
        response = await http.put(uri, headers: mapHeaders, body: body,);
      }
      else if (method == HttpMethod.delete) {
        response = await http.delete(uri, headers: mapHeaders, body: body,);
      }
      else {
        response = await http.get(uri, headers: mapHeaders,);
      }

      //debugPrint('=========Response: ${response.body}');
    }
    catch(e) {
      debugPrint('=========Error http: $e');
    }

    return response;
  }

  static Future<bool> uploadFile({required String url, required String filePath,
    required Map<String, dynamic> params, required String fieldName, HttpMethod method = HttpMethod.post,}) async {
    bool result = false;

    try {
      var request = http.MultipartRequest(method.name.toUpperCase(), Uri.parse(url),);
      params.forEach((key, value) {
        request.fields[key] = value;
      });
      request.files.add(await http.MultipartFile.fromPath(fieldName, filePath));

      var response = await request.send();
      result = response.statusCode == 200;

      //debugPrint('==$url====File uploaded: ${response.statusCode}');
    }
    catch (err) {
      debugPrint('=========Failed to upload file: $err');
    }

    return result;
  }

  static Map getMapFromResponse(http.Response? response) {
    Map map = {};

    if (response != null) {
      try {
        map = jsonDecode(response.body);
        map[fieldStatusCode] = response.statusCode;
      }
      catch (err) {
        //error message
      }
    }

    return map;
  }

  static List getListFromResponse(http.Response? response) {
    List list = [];

    if (response != null) {
      try {
        list = jsonDecode(response.body);
      }
      catch (err) {
        //debugPrint('=======Err $err');
      }
    }

    return list;
  }

}