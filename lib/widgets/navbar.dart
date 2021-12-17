import 'package:flutter/material.dart';
import '../utils/colors.dart';

class NavBar extends StatefulWidget {
  final Function(dynamic item)? onCategoryTap;
  final Function(dynamic item)? onMainCategoryTap;
  NavBar({this.onCategoryTap, this.onMainCategoryTap});
  @override
  State<StatefulWidget> createState() {
    return NavBarState();
  }
}

class NavBarState extends State<NavBar> {
  bool viewall = true;
  int? active_tab;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 60,
      width: MediaQuery.of(context).size.width,
      height: 70,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    active_tab = 1;
                  });
                  widget.onMainCategoryTap!(active_tab);
                },
                child: Container(
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(child: Text("Insurance"))),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    active_tab = 2;
                  });
                  widget.onMainCategoryTap!(active_tab);
                },
                child: Container(
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(child: Text("Towing"))),
              ),
            ),
            // const SizedBox(
            //   width: 20,
            // ),
            // Expanded(
            //   child: GestureDetector(
            //     onTap: () {
            //       setState(() {
            //         active_tab = 3;
            //       });
            //       widget.onMainCategoryTap!(active_tab);
            //     },
            //     child: Container(
            //         height: 40,
            //         width: double.infinity,
            //         decoration: BoxDecoration(
            //             color: Colors.grey[100],
            //             borderRadius: BorderRadius.circular(20)),
            //         child: const Center(child: Text("Car Replacement"))),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
