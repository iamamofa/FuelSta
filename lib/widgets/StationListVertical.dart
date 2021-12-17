// ignore: file_names
// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../utils/action.dart';
import '../models/Station.dart';
import 'StationCard.dart';

// ignore: must_be_immutable
class StationListVertical extends StatefulWidget {
  List<Station> data;
  final onCardClick;
  Function(List data) onDataChanged;
  final Function(bool isscrolling) onScroll;
  double marginTop;
  StationListVertical(
      {Key? key,
      required this.data,
      this.onCardClick,
      required this.onScroll,
      this.marginTop = 130.0,
      required this.onDataChanged})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return StationListVerticalState(
        data: data,
        onCardClick: onCardClick,
        onScroll: onScroll,
        marginTop: this.marginTop);
  }
}

class StationListVerticalState extends State<StationListVertical> {
  @override
  List<Station> data = [];
  final onCardClick;
  final Function onScroll;
  double marginTop;
  ScrollController scrollcontroller = ScrollController();
  StationListVerticalState(
      {required this.data,
      this.onCardClick,
      required this.onScroll,
      required this.marginTop});
  bool showAppbar = true;
  bool isScrollingDown = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: marginTop),
      child: ListView(
        controller: scrollcontroller,
        children: ListItems(),
      ),
    );
  }

  List<Widget> ListItems() {
    List<Widget> list = [];
    for (Station station in widget.data) {
      list.add(
        StationCard(
          marginBottom: 2,
          station: station,
          onCardTap: (value) {
            widget.onCardClick(value);
          },
          onCalltap: (value) {},
          onDirectionTap: (LatLng value, Station station) {},
        ),
      );
    }
    return list;
  }
}
