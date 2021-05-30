import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'MainActivity.dart';

class Session {
  Map<String, String> headers = { "Content-Type": "application/json", "Accept": "application/json"};
  String PostProfile = 'http://ot.ekatm.co.in/api/otAPI/PostProfile';

//Post API Call
  Future<Map> get(String url1,dynamic data,String url2) async {
    String res ;
    http.Response response = await http.get(url1, headers: headers);
    updateCookie(response);
    if(jsonDecode(response.body) == true) {
      response = await http.post(url2, body: data, headers: headers);
      updateCookie(response);
       res = jsonDecode(response.body);

    }
    return jsonDecode(response.body);

  }



  void updateCookie(http.Response response) {
    String rawCookie = response.headers['set-cookie'];
    if (rawCookie != null) {
      int index = rawCookie.indexOf(';');
      headers['cookie'] =
      (index == -1) ? rawCookie : rawCookie.substring(0, index);
    }
  }
}