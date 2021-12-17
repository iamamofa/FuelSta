// ignore: file_names
// ignore_for_file: file_names
import 'package:flutter/material.dart';
import '../arguments/OmcDetailsArgs.dart';
import '../notifiers/Station_Notifier.dart';
import '../routing/routes.dart';
import '../widgets/StationListVertical.dart';
import '../widgets/showmapbutton.dart';
import 'package:provider/provider.dart';
import '../models/Station.dart';
import '../widgets/StationListHorizontal.dart';
import '../widgets/TopBar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../widgets/navbar.dart';

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return IndexState();
  }
}

class IndexState extends State<Index> {
  int current_tab = 1;
  final LatLng _center = const LatLng(5.6499974, -0.1833326);
  bool showHorizontal = true;
  GoogleMapController? controller;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        if (showHorizontal)
          GoogleMap(
            compassEnabled: false,
            mapToolbarEnabled: false,
            rotateGesturesEnabled: true,
            myLocationButtonEnabled: false,
            myLocationEnabled: false,
            initialCameraPosition: CameraPosition(target: _center, zoom: 12),
            onMapCreated: _onMapCreated,
          ),
        if (!showHorizontal)
          Container(
            decoration: BoxDecoration(color: Colors.grey[100]),
          ),
        if (!showHorizontal)
          Consumer<StationNotifier>(builder: (context, notifier, _) {
            return StationListVertical(
              data: notifier.stations,
              onCardClick: (value) {
                Navigator.pushNamed(context, omc_details,
                    arguments: OmcDetailsArgs(value));
              },
              onScroll: (bool isscrolling) {},
              onDataChanged: (List<dynamic> data) {},
            );
          }),
        TopBar(
          onClickPopupMenu: (result) {},
          onRefreshTap: () {},
          onLocationCLick: () {},
          onFilterComplete: (value) async {},
        ),
        NavBar(
          onMainCategoryTap: (value) {},
          onCategoryTap: (value) async {},
        ),
        if (showHorizontal)
          Consumer<StationNotifier>(
            builder: (context, notifier, _) {
              return StationListHorizontal(
                data: notifier.stations,
                onCardClick: (Station value) {
                  Navigator.pushNamed(context, omc_details,
                      arguments: OmcDetailsArgs(value));
                },
                ontapViewList: () {
                  setState(() {
                    showHorizontal = false;
                  });
                },
                onDirectionTap: (value) {},
                onScrollEnd: (value) {},
              );
            },
          ),
        if (!showHorizontal)
          ShowMapButton(
            () {
              setState(
                () {
                  showHorizontal = !showHorizontal;
                },
              );
            },
          )
      ],
    );
  }

  void _onMapCreated(GoogleMapController controllerParam) async {
    controller = controllerParam;
    StationNotifier notifier =
        Provider.of<StationNotifier>(context, listen: false);
    if (notifier.stations.isEmpty) {
      notifier.fetchStations();
    }
  }
}
