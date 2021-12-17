// ignore: file_names
// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'SearchWidget.dart';
import '../utils/colors.dart';
import '../utils/menu.dart';

class TopBar extends StatelessWidget {
  @override
  final onClickPopupMenu;
  final onLocationCLick;
  final onFilterComplete;
  final onRefreshTap;
  final activeCategory;
  TopBar(
      {this.onClickPopupMenu,
      this.onLocationCLick,
      this.onFilterComplete,
      this.onRefreshTap,
      this.activeCategory = null});
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            width: 250,
            child: SearchWidget(
              onInputTap: () async {},
            ),
          ),
          GestureDetector(
            onTap: () {
              onLocationCLick();
            },
            child: ClipOval(
              child: Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 2),
                      blurRadius: 8.0,
                    ),
                  ],
                ),
                child: const Center(
                  child: Icon(
                    Icons.my_location,
                    color: YELLOW,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(
                      MediaQuery.of(context).size.width, 100, 8, 0),
                  items: MenuList(context));
            },
            child: Container(
              width: 30,
              height: 30,
              color: Colors.white,
              child: Image.asset(
                'assets/images/action.png',
                width: 25,
                height: 25,
              ),
            ),
          )
        ],
      ),
    );
  }
}
