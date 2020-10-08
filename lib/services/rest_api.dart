import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RestApi {

  int statusCode;
  Map mapResult;
  BuildContext context;

  RestApi(this.context);

  Future<Map> getDataFromServer(String url, Map<String,dynamic> params) async {
    Map<String,dynamic> map = {

    };
    if (params != null) {
      map.addAll(params);
    }

    try{
      FormData formData = new FormData.fromMap(map);
      final response = await Dio().post(url, data: formData);
      this.statusCode = response.statusCode;
      if (response.statusCode == 200) {
          //print(response.data.toString());
          mapResult = response.data;
      }
    }
    catch(e) {
      //print(e);
    }

    return mapResult;
  }

}