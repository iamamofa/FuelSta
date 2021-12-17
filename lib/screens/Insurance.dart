// ignore: file_names
// ignore_for_file: file_names
import 'package:flutter/material.dart';
import '../utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';

class Insurance extends StatefulWidget {
  @override
  createState() {
    return InsuranceState();
  }
}

class InsuranceState extends State<Insurance> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text("INSURANCES"),
        centerTitle: true,
        backgroundColor: YELLOW,
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 2.0),
            child: GestureDetector(
              onTap: () {},
              child: const Card(
                elevation: 1,
                child: ListTile(
                  title: Text("Insurance Package Name"),
                  subtitle: Text("Insurance Description hert"),
                  isThreeLine: true,
                  leading: CircleAvatar(child: Icon(Icons.accessible)),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
