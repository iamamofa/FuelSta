// ignore_for_file: file_names
import 'package:flutter/cupertino.dart';

import 'Product.dart';

class Station {
  String? name;
  int? id;
  String? branch;
  String? locationDescription;
  double? latitude;
  double? longitude;
  String? region;
  String? city;
  String? town;
  String? mobileNumber;
  String? logo;
  List<Product> products = [];

  Station(
      {required String id,
      required String name,
      required String branch,
      required String latitude,
      required String longitude,
      required String locationDescription,
      required String mobileNumber,
      required String logo}) {
    id = id;
    name = name;
    latitude = latitude;
    longitude = longitude;
    mobileNumber = mobileNumber;
    logo = logo;
  }

  Station.fromJson(Map<String, dynamic> parsedJson) {
    name = parsedJson["name"];
    id = parsedJson["id"];
    branch = parsedJson["branch"];
    latitude = parsedJson["latitude"];
    locationDescription = parsedJson["locationDescription"];
    region = parsedJson["region"];
    city = parsedJson["city"];
    longitude = parsedJson["longitude"];
    mobileNumber = parsedJson["mobileNumber"];
    logo = parsedJson["logo"];
    if (parsedJson["products"] != null) {
      parsedJson["products"].forEach((e) {
        products.add(Product.fromJson(e));
      });
    }
  }
}
