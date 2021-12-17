import 'package:flutter/material.dart';
import 'package:omc_app/arguments/OmcDetailsArgs.dart';
import '../arguments/OtpArgs.dart';
import '../screens/About.dart';
import '../screens/Account.dart';
import '../screens/Help.dart';
import '../screens/Home.dart';
import '../screens/Insurance.dart';
import '../screens/Landing.dart';
import '../screens/Login.dart';
import '../screens/OmcDetails.dart';
import '../screens/Otp.dart';
import '../screens/Register.dart';
import '../screens/Services.dart';
import 'routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case login:
      return MaterialPageRoute(builder: (context) => Login());
    case register:
      return MaterialPageRoute(builder: (context) => Register());
    case landing:
      return MaterialPageRoute(builder: (context) => Landing());
    case otp:
      final OtpArgs args = settings.arguments as OtpArgs;
      return MaterialPageRoute(
        builder: (context) => Otp(
          args.token,
          args.phone,
          args.data,
        ),
      );
    case home:
      return MaterialPageRoute(builder: (context) => Home());
    case about:
      return MaterialPageRoute(builder: (context) => About());
    case help:
      return MaterialPageRoute(builder: (context) => Help());
    case services:
      return MaterialPageRoute(builder: (context) => Services());
    case account:
      return MaterialPageRoute(builder: (context) => Account());
    case insurance:
      return MaterialPageRoute(builder: (context) => Insurance());
    case omc_details:
      OmcDetailsArgs args = settings.arguments as OmcDetailsArgs;
      print(args);
      return MaterialPageRoute(builder: (context) => OmcDetails(args.station));
    default:
      return MaterialPageRoute(builder: (context) => Login());
  }
}
