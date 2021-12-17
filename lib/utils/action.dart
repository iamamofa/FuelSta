import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'env.dart';
import 'dart:io' show Platform;
import 'package:flutter/services.dart';
import 'package:device_info/device_info.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> OpenDialog(String title, String message, BuildContext context,
    {Function? onOkTop}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(message),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
              if (onOkTop != null) {
                onOkTop();
              }
            },
          ),
        ],
      );
    },
  );
}

Future<ProgressDialog> showLoading(BuildContext context,
    {String? message}) async {
  final ProgressDialog pr = ProgressDialog(
    context,
    type: ProgressDialogType.Normal,
    isDismissible: false,
    customBody: SizedBox(
      height: 60,
      width: 60,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
              backgroundColor: Colors.white,
            ),
            const SizedBox(width: 10),
            if (message != null)
              Text(
                message,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
          ],
        ),
      ),
    ),
  );
  await pr.show();
  return pr;
}

Future<void> closeLoading(ProgressDialog pr) async {
  await pr.hide();
}

Future<void> setUpDeviceInfo() async {
  try {
    if (Platform.isAndroid) {
      platform = 'ANDROID';
      AndroidDeviceInfo info = await DeviceInfoPlugin().androidInfo;
      DeviceID = info.device;
    } else if (Platform.isIOS) {
      platform = 'IOS';
      IosDeviceInfo info = await DeviceInfoPlugin().iosInfo;
      DeviceID = info.name;
    }
  } on PlatformException {}
}

Future<void> shareItem(String data) async {
  try {
    if (Platform.isAndroid) {
      await Share.share(data + ' ' + hyve_shared_links["AppAndroid"]);
    } else if (Platform.isIOS) {
      await Share.share(data + ' ' + hyve_shared_links["AppIOS"]);
    }
  } on PlatformException {}
}

//the data will return the stringify version of the user information
Future<Map> initialiseApp(BuildContext context) async {
  await setUpDeviceInfo();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var data = prefs.getString('UserData');
  String? hyve_links = prefs.getString('hyve_shared_links');
  if (hyve_links != null) {
    hyve_shared_links = jsonDecode(hyve_links);
  } else {
    hyve_shared_links = {"AppIOS": '', 'AppAndroid': ''};
  }
  String? lastlocation = prefs
      .getString('LastLocation'); // keeping string of last location in an array
  if (lastlocation != null) {
    try {
      List<String> parts = lastlocation.split(',');
      latitude = parts[0];
      longitude = parts[1];
    } catch (e) {}
  }
  return {"UserData": data, "LastLocation": lastlocation};
}

//this function will save the location in sharedpreference

saveLocation() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('LastLocation', latitude + ',' + longitude);
}

launchGoogleMap(String Latitude, String Longitude, {String Title = ""}) async {
  String googleUrl = "https://www.google.com/maps/dir/?api=1&origin=" +
      latitude +
      ',' +
      longitude +
      "&destination=" +
      Latitude +
      ',' +
      Longitude +
      "&dir_action=navigate";
  //print(googleUrl);
  if (await canLaunch(googleUrl)) {
    await launch(googleUrl);
  } else {
    throw 'Could not open the map.';
  }
}

callNumber(String tel, GlobalKey<ScaffoldState>? scaffoldKey,
    BuildContext context) async {
  String url = 'tel:${tel}';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Sorry, Calling $tel Failed')));
  }
}
