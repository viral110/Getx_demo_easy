import 'dart:convert';

import 'package:bloc_api/Model/makeup_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static var client = http.Client();
  static Future<List<MakeUpModel>?> getProducts() async {
    try {
      var response = await client.get(Uri.parse(
          "https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline"));
      if (response.statusCode == 200) {
        var decoded = response.body;
        return makeUpModelFromJson(decoded);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("Error in Fetch : ${e.toString()}");
    }
  }
}
