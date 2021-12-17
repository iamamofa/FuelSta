// ignore: file_names
// ignore_for_file: file_names
import 'dart:convert';
import 'dart:core';

import 'package:shared_preferences/shared_preferences.dart';

class User {
  int? id;
  String? username;
  String? phone;
  String? email;
  String? latitude;
  String? longitude;
  String? ip;

  User.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    username = parsedJson['username'];
    phone = parsedJson['phone'];
    email = parsedJson['email'];
    latitude = parsedJson['latitude'];
    longitude = parsedJson['longitude'];
    ip = parsedJson['ip'];
  }

  convertToMap() {
    return {
      "id": id,
      "username": username,
      "phone": phone,
      "email": email,
      "latitude": latitude,
      "longitude": longitude,
      "ip": ip,
    };
  }

  save() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("UserData", jsonEncode(convertToMap()));
  }
}
