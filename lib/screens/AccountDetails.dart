// ignore_for_file: file_names
import '../notifiers/User_Notifier.dart';
import '../models/User.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AccountDetailsState();
  }
}

class AccountDetailsState extends State<AccountDetails> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserNotifier>(builder: (context, notifier, _) {
      return ListView(
        children: [
          ListTile(
            title: const Text("Full Name"),
            subtitle: Text("${notifier.user!.username}"),
            leading: const Icon(Icons.person),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit),
            ),
          ),
          ListTile(
            title: const Text("Email"),
            subtitle: Text("${notifier.user!.email}"),
            leading: const Icon(Icons.email),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit),
            ),
          ),
          ListTile(
            title: const Text("Phone"),
            subtitle: Text("${notifier.user!.phone}"),
            leading: const Icon(Icons.phone),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      );
    });
  }
}
