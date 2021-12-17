// ignore: file_names
// ignore_for_file: file_names
import '../models/User.dart';
import '../resources/AuthRepo.dart';
import 'package:flutter/foundation.dart';
import '../utils/env.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class UserNotifier extends ChangeNotifier {
  // ignore: non_constant_identifier_names
  UserNotifier({required Map<String, dynamic> user_data}) {
    if (user_data.isNotEmpty) {
      user = User.fromJson(user_data);
      is_loggedin = true;
      print('UserNotifier in UserNotifier');
      notifyListeners();
    }
  }

  User? user;
  bool shownavbar = true;
  bool is_loggedin = false;

  showNavBar(bool toshow) {
    shownavbar = toshow;
    print('showNavBar in UserNotifier');
    notifyListeners();
  }

  ifLoggedIn() async {
    if (user != null) {
      is_loggedin = true;
      notifyListeners();
      return;
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('UserData');
    if (data != null) {
      user = User.fromJson(jsonDecode(data));
    }
    if (user != null) {
      is_loggedin = true;
      print('ifLoggedIn in UserNotifier');
      notifyListeners();
    }
    return;
  }

  updateDetails(Map<String, dynamic> details) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userData = prefs.getString("UserData");
    if (userData != null) {
      Map<String, dynamic> data = jsonDecode(userData);
      user!.id = data["id"] = details["id"];
      user!.username = data["username"] = details["username"];
      user!.phone = data["phone"] = details["phone"];
      user!.email = data["email"] = details["email"];
      user!.latitude = data["latitude"] = details["latitude"];
      user!.longitude = data["longitude"] = details["longitude"];
      prefs.setString("UserData", jsonEncode(data));
      print('updateDetails in UserNotifier');
      notifyListeners();
    }
  }

  login({String mobile_number = "", String password = ""}) async {
    print("Starting");
    var response = await AuthRepo()
        .login(mobile_number: mobile_number, password: password);
    print(response['Status'] == "1");
    if (response["Status"] == 1) {
      User convertuser = User.fromJson(response["Data"]);
      user = convertuser;
      print(user);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('UserData', jsonEncode(response['Data']));
      hyve_shared_links = {
        'AppIOS': response["Data"]["AppIOS"],
        'AppAndroid': response["Data"]["AppAndroid"],
      };
      prefs.setString('hyve_shared_links', jsonEncode(hyve_shared_links));
      is_loggedin = true;
      print('login in UserNotifier');
      notifyListeners();
      return {"response": response, 'user': convertuser};
    } else {
      return {"response": response};
    }
  }

  Register(
      {String fullname = '',
      String mobile_number = '',
      String email = '',
      String password = '',
      String latitude = '',
      String longitude = ''}) async {
    var response = await AuthRepo().register(
        fullname: fullname,
        mobile_number: mobile_number,
        email: email,
        password: password,
        latitude: latitude,
        longitude: longitude);
    if (response["Status"] == 1) {
      User convertuser = User.fromJson(response["Data"]);
      user = convertuser;
      print(user);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('UserData', jsonEncode(response['Data']));
      hyve_shared_links = {
        'AppIOS': response["Data"]["AppIOS"],
        'AppAndroid': response["Data"]["AppAndroid"],
      };
      prefs.setString('hyve_shared_links', jsonEncode(hyve_shared_links));
      is_loggedin = true;
      // advertData = response["AdvertData"];
      //print(advertData);
      print('signUp in UserNotifier');
      notifyListeners();
      return {"response": response, 'user': convertuser};
    } else {
      return {"response": response};
    }
  }

  // uploadImage(
  //     {String UserID, String EventID, String AdvertID, String filepath}) async {
  //   Map response = await ApiRepository().postImage(
  //       UserID: UserID,
  //       EventID: EventID,
  //       filepath: filepath,
  //       AdvertID: AdvertID);
  //   return response;
  // }
  //
  // UpdateProfile(Map<String, dynamic> data) async {
  //   Map response = await AuthRepo().updateProfile();
  //   return response;
  // }
}
