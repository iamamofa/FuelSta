import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountHistory extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AccountHistoryState();
  }
}

class AccountHistoryState extends State<AccountHistory> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (var i in [1, 2, 3, 4, 5])
          ListTile(
            leading: Icon(CupertinoIcons.doc_on_doc),
            title: Text("GHS 30 at Goil"),
            subtitle: Text('Click for more'),
          )
      ],
    );
  }
}
