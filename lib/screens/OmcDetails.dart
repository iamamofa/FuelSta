// ignore_for_file: file_names
import 'package:flutter/material.dart';
import '../models/Station.dart';

import '../utils/colors.dart';
import '../utils/env.dart';

class OmcDetails extends StatefulWidget {
  OmcDetails(this.station, {Key? key}) : super(key: key);
  Station station;

  @override
  State<StatefulWidget> createState() {
    return OmcDetailsState();
  }
}

class OmcDetailsState extends State<OmcDetails> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  double userrating = 1.0;
  final reviewController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text(
          APP_NAME,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: YELLOW,
      ),
      body: ListView(
        children: [
          Container(
            height: 250,
            decoration: widget.station.logo != null
                ? const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(LOGO), fit: BoxFit.cover),
                  )
                : BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.station.logo ?? ""),
                        fit: BoxFit.cover)),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.station.name!.toUpperCase() +
                      "\n\n" +
                      "${widget.station.locationDescription}",
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 30,
                        width: 80,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: RED,
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                          child: Text(
                            "Contact",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 30,
                        width: 120,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                          child: Text(
                            "View on map",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    // GestureDetector(
                    //   onTap: () {},
                    //   child: Container(
                    //     height: 30,
                    //     width: 70,
                    //     padding: const EdgeInsets.all(5),
                    //     decoration: BoxDecoration(
                    //         border: Border.all(color: Colors.grey),
                    //         borderRadius: BorderRadius.circular(20)),
                    //     child: const Center(
                    //       child: Text(
                    //         "Rate",
                    //         style: TextStyle(color: Colors.black),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 30,
                        width: 70,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                          child: Text(
                            "Share",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 18.0),
            child: Text(
              "PRODUCTS",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.station.products.length,
            itemBuilder: (context, i) {
              return ListTile(
                leading: CircleAvatar(
                  child: Text(widget.station.products[i].name![0]),
                ),
                title: Text(
                  "${widget.station.products[i].name}",
                ),
                subtitle: Text(
                    "${widget.station.products[i].price} / ${widget.station.products[i].units}"),
                trailing: const Icon(Icons.add_shopping_cart),
              );
            },
          ),

          Divider(
            color: Colors.grey[200],
            height: 10,
            thickness: 5,
          ),
          const SizedBox(
            height: 20,
          ),
          //start
          const Padding(
            padding: EdgeInsets.only(left: 18.0),
            child: Text(
              "REVIEWS",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(
            color: Colors.grey[200],
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
