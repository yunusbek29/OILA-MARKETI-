// ignore_for_file: constant_identifier_names

import 'package:http/http.dart';

class Product {
  // ignore: non_constant_identifier_names
  static String BASE_URL = 'fakestoreapi.com';
  static const Map<String, String> header = {
    "Content-type": "application/json; charset=UTF-8",
  };

  /* Http apis */
  static const String GET_PRODUCT = "/products";
  static const String GET_USER = "/users";

  /* Http requests */
  // ignore: non_constant_identifier_names
  static Future<String?> GET(String api, Map<String, dynamic> params) async {
    final uri = Uri.https(BASE_URL, api, params);
    var response = await get(uri, headers: header);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }
}
