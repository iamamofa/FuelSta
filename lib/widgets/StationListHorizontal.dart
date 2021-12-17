// ignore: file_names
// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../utils/colors.dart';
import '../models/Station.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart' as P;
import 'StationCard.dart';

class StationListHorizontal extends StatefulWidget {
  final List data;
  final ontapViewList;
  final onCardClick;
  final Function onDirectionTap;
  final Function? onScrollEnd;
  StationListHorizontal(
      {required this.data,
      this.ontapViewList,
      this.onCardClick,
      required this.onDirectionTap,
      this.onScrollEnd});
  @override
  State<StatefulWidget> createState() {
    return StationListHorizontalState();
  }
}

class StationListHorizontalState extends State<StationListHorizontal> {
  @override
  var currentItem;
  bool isScrollingDown = false;
  ScrollController scrollcontroller = ScrollController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (widget.data.length > 0)
            GestureDetector(
              onTap: widget.ontapViewList,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  //border: Border.all(color: yellow),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 0.5),
                      blurRadius: 5.0,
                    ),
                  ],
                ),
                height: 35,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(right: 20, bottom: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Icon(
                      Icons.list,
                      color: YELLOW,
                      size: 15,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "View list",
                      style: TextStyle(color: YELLOW),
                    ),
                  ],
                ),
              ),
            ),
          SizedBox(
            height: 250,
            child: ScrollSnapList(
              onItemFocus: (val) {
                currentItem = widget.data[val];
                widget.onScrollEnd!(currentItem);
              },
              reverse: false,
              listController: scrollcontroller,
              scrollDirection: Axis.horizontal,
              itemCount: widget.data.length,
              itemSize: 360,
              itemBuilder: (BuildContext context, int index) {
                return StationCard(
                  marginBottom: 40,
                  station: widget.data[index],
                  onCardTap: (value) {
                    widget.onCardClick(value);
                  },
                  onCalltap: (value) {},
                  onDirectionTap: (LatLng value, Station station) {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
