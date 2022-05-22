import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_structure/utils/constants.dart';
import 'package:flutter_structure/utils/enums.dart';
import 'package:http/http.dart' as http;

class RestApi {

  String headerToken;

  RestApi({this.headerToken: ''});

  Future<http.Response?> getDataFromServer(String url, Map<String,dynamic> mapParams, {HttpMethod method: HttpMethod.Post,
    List<Map<String,dynamic>>? listParams}) async {
    http.Response? response;

    var params = listParams?? mapParams;
    Map<String, String> mapHeaders = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $headerToken"
    };
    Uri uri = Uri.parse(url);
    String body = jsonEncode(params);

    try{
      //debugPrint('=======$url====$method===${jsonEncode(params)}');

      if (method == HttpMethod.Post) {
        response = await http.post(uri, headers: mapHeaders, body: body,);
      }
      else if (method == HttpMethod.Put) {
        response = await http.put(uri, headers: mapHeaders, body: body,);
      }
      else if (method == HttpMethod.Delete) {
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
    required Map<String, dynamic> params, required String fieldName, HttpMethod method: HttpMethod.Post,}) async {
    bool result = false;

    try {
      var request = new http.MultipartRequest(method.name.toUpperCase(), Uri.parse(url),);
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
        map[FIELD_STATUS_CODE] = response.statusCode;
      }
      catch (err) {

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