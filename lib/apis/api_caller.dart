import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../global.dart';

String version = "v1";

Future<Map<String, dynamic>> getUsersByEmail(String email) async {
  Map<String, dynamic> result = {"data":[],"message":"not found"};
  String url = "${Global.baseUrl}/api/$version/users/getByEmail?email=$email";
  final http.Response response = await http.get(Uri.parse(
      url));

  if (response.statusCode == 200) {
    log(response.body);
    result = await jsonDecode(response.body);
  } else {
    log("Unsuccessful");
  }
  return result;
}

Future<Map<String, dynamic>> getUsersByEmailAndPassword(String email, String password) async {
  Map<String, dynamic> result = {"data":[],"message":"not found"};
  String url = "${Global.baseUrl}/api/$version/users/getByEmailAndPassword?email=$email&password=$password";
  final http.Response response = await http.get(Uri.parse(
      url));

  if (response.statusCode == 200) {
    log(response.body);
    result = await jsonDecode(response.body);
  } else {
    log("Unsuccessful");
  }
  return result;
}

Future<bool> createUser(Map<String, dynamic> data) async {
  String url = "${Global.baseUrl}/api/$version/users/add";

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 201) {
      log('API Response: ${response.body}');
      Map<String, dynamic> map = jsonDecode(response.body);
      if(map["data"] == "added"){
        return true;
      } else {
        return false;
      }
    } else {
      log('API Error: ${response.statusCode}, ${response.body}');
      return false;
    }
  } catch (e) {
    log('Error: $e');
    return false;
  }
  return false;
}

