// ignore: file_names
// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/User.dart';
import '../models/Service.dart';
import '../routing/routes.dart';
import '../widgets/Retry.dart';
import '../utils/colors.dart';

class Services extends StatefulWidget {
  final bool withscafold;
  Services({this.withscafold = false});
  @override
  State<StatefulWidget> createState() {
    return ServicesState();
  }
}

class ServicesState extends State<Services> {
  BuildContext? mycontext;
  @override
  Widget build(BuildContext context) {
    mycontext = context;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Our Services"),
        backgroundColor: YELLOW,
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  margin: const EdgeInsets.only(top: 5, left: 8, right: 8),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/service_floor.jpg'),
                                fit: BoxFit.fill)),
                      ),
                      Positioned(
                        left: 20,
                        top: 20,
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 150,
                              child: Column(
                                children: [
                                  Text(
                                    'Towing Service'.toUpperCase(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        shadows: [
                                          Shadow(
                                              color: Colors.white,
                                              offset:
                                                  Offset.fromDirection(30.0),
                                              blurRadius: 10),
                                          Shadow(
                                              color: Colors.white,
                                              offset:
                                                  Offset.fromDirection(90.0),
                                              blurRadius: 90)
                                        ]),
                                  ),
                                  Text("Description of service here")
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  margin: EdgeInsets.only(top: 5, left: 8, right: 8),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/service_floor.jpg'),
                                fit: BoxFit.fill)),
                      ),
                      Positioned(
                        left: 20,
                        top: 20,
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 200,
                              child: Column(
                                children: [
                                  Text(
                                    'Car Replacement Service'.toUpperCase(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        shadows: [
                                          Shadow(
                                              color: Colors.white,
                                              offset:
                                                  Offset.fromDirection(30.0),
                                              blurRadius: 10),
                                          Shadow(
                                              color: Colors.white,
                                              offset:
                                                  Offset.fromDirection(90.0),
                                              blurRadius: 90)
                                        ]),
                                  ),
                                  Text("Description of service here")
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  margin: EdgeInsets.only(top: 5, left: 8, right: 8),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/service_floor.jpg'),
                                fit: BoxFit.fill)),
                      ),
                      Positioned(
                        left: 20,
                        top: 20,
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 150,
                              child: Column(
                                children: [
                                  Text(
                                    'LPG Delivery'.toUpperCase(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        shadows: [
                                          Shadow(
                                              color: Colors.white,
                                              offset:
                                                  Offset.fromDirection(30.0),
                                              blurRadius: 10),
                                          Shadow(
                                              color: Colors.white,
                                              offset:
                                                  Offset.fromDirection(90.0),
                                              blurRadius: 90)
                                        ]),
                                  ),
                                  Text("Description of service here")
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
