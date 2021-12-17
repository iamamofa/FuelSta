// ignore: file_names
// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../routing/routes.dart';
import '../utils/env.dart';
import '../models/Station.dart';
import '../utils/colors.dart';
import 'StationChip.dart';

class StationCard extends StatelessWidget {
  final Station station;
  final Function(dynamic value)? onCardTap;
  final Function(dynamic value)? onCalltap;
  final Function(LatLng value, Station station)? onDirectionTap;
  final double marginBottom;
  final bool directionbtn;
  final String showbtn_at;
  final bool callbtn;
  StationCard(
      {required this.station,
      this.onCardTap,
      this.onCalltap,
      this.onDirectionTap,
      this.showbtn_at = 'horizontali',
      this.marginBottom = 0,
      this.callbtn = true,
      this.directionbtn = true});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onCardTap!(station);
      },
      child: Container(
        margin: showbtn_at == 'horizontal'
            ? EdgeInsets.only(bottom: marginBottom)
            : EdgeInsets.only(bottom: marginBottom, left: 1, right: 1),
        height: 200,
        width: 360,
        child: Card(
          elevation: 5,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 12, left: 12, right: 12, bottom: 0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border:
                                    Border.all(color: const Color(0xFFEFEFEF))),
                            margin: const EdgeInsets.only(
                                left: 10, top: 10, bottom: 10),
                            child: ClipOval(
                              child: FadeInImage(
                                  placeholder: const AssetImage(LOGO),
                                  image: NetworkImage(station.logo ?? "")),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: station.name! +
                                        "\n" +
                                        station.locationDescription!,
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.black54),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (station.products.isNotEmpty)
                        Expanded(
                          child: Wrap(
                            spacing: 1,
                            runSpacing: 1,
                            children: station.products
                                .map((e) => StationChip(e))
                                .toList(),
                          ),
                        ),

                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "3min away",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            )
                          ],
                        ),
                      ),
                      // Row(
                      //   children: [
                      //     Flexible(
                      //       child: GestureDetector(
                      //         onTap: () {
                      //           Navigator.of(context).pushNamed(omc_details);
                      //         },
                      //         child: Container(
                      //           width: 100,
                      //           height: 30,
                      //           child: const Center(
                      //             child: Text(
                      //               'View Details',
                      //               style: TextStyle(color: YELLOW),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     )
                      //   ],
                      // ),
                      if (showbtn_at == 'horizontal')
                        Row(
                          children: [
                            if (directionbtn && station.latitude != null)
                              GestureDetector(
                                onTap: () async {
                                  // onDirectionTap!(
                                  //     LatLng(double.parse(station.latitude),
                                  //         double.parse(station.longitude)),
                                  //     station!);
                                },
                                child: const Chip(
                                  avatar: Icon(
                                    Icons.directions,
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                  label: Text(
                                    "Directions",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: YELLOW,
                                ),
                              ),
                            const SizedBox(
                              width: 10,
                            ),
                            if (callbtn && station.mobileNumber != null)
                              GestureDetector(
                                onTap: () {
                                  // this.onCalltap(station.mobileNumber);
                                },
                                child: const Chip(
                                  avatar: Icon(
                                    Icons.call,
                                    size: 15,
                                    color: YELLOW,
                                  ),
                                  label: Text(
                                    "Call",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                          ],
                        ),
                    ],
                  ),
                ),
                if (showbtn_at == 'vertical')
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      if (directionbtn && station.latitude != null)
                        GestureDetector(
                          onTap: () async {
                            // onDirectionTap(
                            //     LatLng(double.parse(station.latitude),
                            //         double.parse(station.longitude)),
                            //     station);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            decoration: BoxDecoration(
                                color: YELLOW,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Icon(
                              Icons.directions,
                              size: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      const SizedBox(
                        height: 10,
                      ),
                      if (callbtn && station.mobileNumber != null)
                        GestureDetector(
                          onTap: () {
                            // this.onCalltap(station.mobileNumber);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(10)),
                            child: const Icon(
                              Icons.call,
                              size: 15,
                              color: YELLOW,
                            ),
                          ),
                        ),
                    ],
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
