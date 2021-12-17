// ignore: file_names
// ignore_for_file: file_names
import 'package:flutter/foundation.dart';
import '../utils/env.dart';
import '../models/Station.dart';
import '../resources/StationRepo.dart';

class StationNotifier extends ChangeNotifier {
  List<Station> stations = [];

  fetchStations() async {
    Map response = await StationRepo()
        .fetchStations(latitude: latitude, longitude: longitude);
    if (response['Status'] == 1) {
      stations = [];
      response["Data"].forEach((e) {
        stations.add(Station.fromJson(e));
      });
      // ignore: avoid_print
      print('Loading Station Done');
      notifyListeners();
    }
  }
}
