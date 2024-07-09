import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url}) async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there is a problem in a status code ${response.statusCode}');
    }
  }

  Future<dynamic> post(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    // final String base_url =
    //     'https://virtserver.swaggerhub.com/MARIEMMAHFOUZ19/can/1.0.0';
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({"Authorization": "Bearer $token"});
    }
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    Map<String, dynamic> data = jsonDecode(response.body);
    return data;
    // print(response.body);
  }
}
