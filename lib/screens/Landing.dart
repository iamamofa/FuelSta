// ignore: file_names
// ignore_for_file: file_names
import 'dart:io';
import '../routing/routes.dart';
import '../utils/action.dart';
import '../utils/colors.dart';
import '../utils/env.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:location/location.dart';

class Landing extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LandingState();
  }
}

class LandingState extends State<Landing> {
  bool? serviceEnabled;
  PermissionStatus? permissionGranted;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    performInitialization(context);
    return Scaffold(
      key: scaffoldKey,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Colors.white, Colors.white])),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                LOGO,
                width: 150,
              ),
              SizedBox(height: 25),
              const Text(
                APP_NAME,
                style: TextStyle(
                    fontSize: 50, color: GRAY, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                DESCRIPTION,
                style: TextStyle(fontSize: 25, color: GRAY),
              ),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 60,
                child: LoadingIndicator(
                  indicatorType: Indicator.ballRotateChase,
                  colors: [GRAY],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<LocationData?> getLocationInfo(BuildContext context) async {
    Location location = Location();
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled!) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled!) {
        await OpenDialog(
            'Alert', "You need to enable your location to proceed", context);
        return null;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        await OpenDialog(
            'Alert', "You need to enable your location to proceed", context);
        return null;
      }
    }

    LocationData retlocation = await location.getLocation();
    return retlocation;
  }

  didChangeDependencies() {
    super.didChangeDependencies();
  }

  performInitialization(BuildContext context) async {
    Future.delayed(Duration(seconds: 1), () async {
      Map initdata = await initialiseApp(context);
      LocationData loc;
      loc = (await getLocationInfo(context))!;

      if (loc == null) {
        loc = (await getLocationInfo(context))!;
        if (loc == null && initdata["LastLocation"] == null) {
          exit(0);
        }
      }

      if (loc != null) {
        latitude = loc.latitude.toString();
        longitude = loc.longitude.toString();
        saveLocation();
      } else {
        try {
          List<String> parts = initdata["LastLocation"].split(',');
          latitude = parts[0];
          longitude = parts[1];
        } catch (e) {
          print("error ${e}");
        }
      }

      if (initdata["UserData"] == null) {
        Navigator.pushNamed(context, login);
      } else {
        Navigator.pushNamed(context, home);
      }
    });
  }
}
