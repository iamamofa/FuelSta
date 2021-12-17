// ignore_for_file: file_names
import '../utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'Account.dart';
import 'Index.dart';

class Base extends StatefulWidget {
  final Widget? appBar;
  final Widget? body;
  final Key? mykey;
  final Function(Widget widgettorender)? onBottomNavTap;
  Base({this.appBar, this.body, this.mykey, this.onBottomNavTap});
  @override
  createState() {
    return BaseState();
  }
}

class BaseState extends State<Base> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: widget.mykey,
      // appBar: widget.appBar != null
      //     ? widget.appBar
      //     : AppBar(
      //         backgroundColor: app_color,
      //         title: Text("EaziSend"),
      //         actions: [Icon(Icons.more_vert_outlined)],
      //       ),
      extendBody: true,
      body: widget.body,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: APP_COLOR_GRADIENT),
          ),
          child: const Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                widget.onBottomNavTap!(Index());
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 18, horizontal: 8),
                child: Icon(
                  CupertinoIcons.home,
                  color: RED,
                  size: 30,
                ),
              ),
            ),
            // const SizedBox(
            //   width: 5,
            // ),
            // GestureDetector(
            //   onTap: () {
            //     //  widget.onBottomNavTap(Index());
            //   },
            //   child: const Padding(
            //     padding: EdgeInsets.symmetric(vertical: 18, horizontal: 8),
            //     child: Icon(
            //       Icons.apps,
            //       color: RED,
            //       size: 30,
            //     ),
            //   ),
            // ),
            // const SizedBox(
            //   width: 5,
            // ),
            // GestureDetector(
            //   onTap: () {
            //     // widget.onBottomNavTap(Groups());
            //   },
            //   child: const Padding(
            //     padding: EdgeInsets.only(left: 18),
            //     child: Icon(
            //       CupertinoIcons.square_list,
            //       color: RED,
            //       size: 30,
            //     ),
            //   ),
            // ),
            // const SizedBox(
            //   width: 5,
            // ),
            GestureDetector(
              onTap: () {
                widget.onBottomNavTap!(Account());
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  CupertinoIcons.person_alt_circle,
                  color: RED,
                  size: 30,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
