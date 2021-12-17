// ignore_for_file: file_names
import '../utils/env.dart';
import '../utils/colors.dart';
import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  createState() {
    return AboutState();
  }
}

class AboutState extends State<About> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About App"),
        backgroundColor: YELLOW,
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 150,
          ),
          const Text(
            APP_NAME,
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Image.asset(
              LOGO,
              width: 200,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const SizedBox(height: 10),
          const Center(
              child: Text(
            "Copyright 2021. All rights reserved.",
            // style: TextStyle(fontWeight: FontWeight.w700),
          )),
          const SizedBox(
            height: 15,
          ),
          const Center(
            child: Text(
              "Follow us on:",
              // style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
