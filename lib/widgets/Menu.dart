// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../routing/routes.dart';

final List menu = [
  {"icon": Icons.settings, "name": "Settings"},
  {"icon": Icons.help, "name": "Help"},
  {"icon": Icons.feedback, "name": "Rate Us"},
  {"icon": Icons.info, "name": "About Us"},
  {"icon": Icons.exit_to_app, "name": "Logout"},
];

// ignore: non_constant_identifier_names
MenuList(BuildContext context) {
  List<PopupMenuEntry<int>> men = [];
  for (var i = 0; i < menu.length; i++) {
    men.add(
      PopupMenuItem<int>(
        child: ListTile(
          leading: Icon(menu[i]["icon"]),
          title: Text(menu[i]["name"]),
          onTap: () async {
            Navigator.of(context).pop();
            HandleMenuClick(context, i);
          },
        ),
      ),
    );
  }
  return men;
}

// ignore: non_constant_identifier_names
HandleMenuClick(context, result) async {
  switch (result) {
    case 0:
      break;
    case 1:
      // Navigator.of(context).pushNamed(help);
      break;
    case 2:
      break;
    case 3:
      break;
    default:
      // Navigator.of(context).pushNamed(profile);
      break;
  }
}

// ignore: non_constant_identifier_names
Future<void> OpenDialog(BuildContext context, Function onLogoutTap) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Info"),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text("Are you sure you want to logout??"),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Logout'),
            onPressed: () async {
              Navigator.of(context).pop();
              onLogoutTap();
            },
          ),
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
