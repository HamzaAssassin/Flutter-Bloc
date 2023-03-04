import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

extension Success on Response {
  bool get isSucess => statusCode == 200;
}

abstract class APIProvider {
  String get baseUrl => "https://food.elms.pk";
  String get apiUrl;
  String get url => baseUrl + apiUrl;
  dynamic fetch({String endPoint = ""}) async {
    var response = await http.get(Uri.parse(url + endPoint));
    if (response.isSucess) {
      return await jsonDecode(response.body);
    }
    return null;
  }
}
