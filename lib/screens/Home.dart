// ignore: file_names
// ignore_for_file: file_names
import '../screens/Index.dart';
import '../utils/env.dart';
import '../screens/Base.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  Widget viewtoshow = Index();
  @override
  Widget build(BuildContext context) {
    return Base(
      body: SafeArea(child: viewtoshow),
      onBottomNavTap: (Widget widget) {
        setState(() {
          viewtoshow = widget;
        });
      },
    );
  }
}
