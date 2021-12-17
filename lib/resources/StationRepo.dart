// ignore: file_names
// ignore_for_file: file_names
import '../utils/api.dart';
import '../utils/env.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:core';
import '../mocks/stations.dart';

class StationRepo {
  final Api _api = new Api(BASE_URL);

  //routes for search station
  Future<Map<String, dynamic>> search({
    required String queryString,
    required String latitude,
    required String longitude,
  }) async {
    Map<String, dynamic> formdata = {
      "queryString": queryString,
      "latitude": latitude,
      "longitude": longitude
    };
    try {
      final Map<String, dynamic> response =
          await _api.post('/search_station.php', formdata);
      return response;
    } catch (e) {
      return {"Status": -1, "Message": "Request failed... ${e}"};
    }
  }

  //routes for search station
  Future<Map<String, dynamic>> fetchStations({
    required String latitude,
    required String longitude,
  }) async {
    Map<String, dynamic> formdata = {
      "latitude": latitude,
      "longitude": longitude
    };
    try {
      //final Map response = await _api.post('/fetch_station.php', formdata);
      //return response;
      return stationsList;
    } catch (e) {
      return {"Status": -1, "Message": "Request failed... ${e}"};
    }
  }
}
