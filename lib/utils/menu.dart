import 'package:flutter/material.dart';
import '../notifiers/User_Notifier.dart';
import '../routing/routes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final List menu = [
  {"icon": Icons.assignment, "name": "Account"},
  {"icon": Icons.person, "name": "Edit Profile"},
  {"icon": Icons.notifications, "name": "Notification"},
  {"icon": Icons.settings, "name": "Settings"},
  {"icon": Icons.exit_to_app, "name": "Logout"},
];

MenuList(BuildContext context) {
  List<PopupMenuEntry<int>> men = [];
  for (var i = 0; i < menu.length; i++) {
    men.add(
      PopupMenuItem<int>(
        child: ListTile(
          leading: Icon(menu[i]["icon"]),
          title: Text(menu[i]["name"]),
          onTap: () {
            Navigator.of(context).pop();
            HandleMenuClick(context, i);
          },
        ),
      ),
    );
  }
  return men;
}

HandleMenuClick(context, result) async {
  switch (result) {
    case 0:
      Navigator.of(context).pushNamed(account);
      break;
    case 1:
      break;
    case 3:
      //Navigator.of(context).pushNamed(favourite);
      break;
    case 4:
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove('UserData');
      UserNotifier notif = Provider.of<UserNotifier>(context, listen: false);
      notif.user = null;
      notif.is_loggedin = false;
      Navigator.of(context).pushNamedAndRemoveUntil(login, (route) => false);
      break;
    default:
      // Navigator.of(context).pushNamed(profile);
      break;
  }
}
