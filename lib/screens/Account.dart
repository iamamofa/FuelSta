// ignore_for_file: file_names

import 'AccountDetails.dart';
import 'AccountHistory.dart';
import 'AccountReport.dart';
import '../utils/colors.dart';
import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AccountState();
  }
}

class AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: APP_COLOR_GRADIENT)),
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/images/profile.png',
                  width: 120,
                  height: 120,
                ),
                const Text(
                  'User Profile',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 55,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.black12, offset: Offset(2, 2)),
                      ],
                    ),
                    child: const TabBar(
                      labelColor: Colors.black87,
                      indicatorColor: YELLOW,
                      tabs: <Widget>[
                        Tab(
                          child: Text(
                            "Details",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "History",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        // Tab(
                        //   child: Text(
                        //     "Reports",
                        //     style: TextStyle(
                        //         fontWeight: FontWeight.bold, fontSize: 16),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 12,
                    child: TabBarView(
                      children: <Widget>[
                        Center(
                          child: AccountDetails(),
                        ),
                        Center(
                          child: AccountHistory(),
                        ),
                        // Center(
                        //   child: AccountReport(),
                        // )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
