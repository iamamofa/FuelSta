// ignore_for_file: file_names
import '../utils/colors.dart';
import '../utils/env.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:url_launcher/url_launcher.dart';

class Help extends StatelessWidget {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: YELLOW,
        title: const Text("Help"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Image.asset('assets/images/help.png'),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(
                NEED_HELP_TEXT,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                for (var c in APP_CONTACTS)
                  GestureDetector(
                    onTap: () {
                      callNumber(c, context);
                    },
                    child: Card(
                      child: ListTile(
                        leading: const Icon(CupertinoIcons.phone),
                        title: Text(
                          c,
                          style: const TextStyle(fontSize: 18),
                        ),
                        trailing: const Icon(CupertinoIcons.arrow_right_circle),
                      ),
                    ),
                  ),
              ],
            ),
            GestureDetector(
              onTap: () {
                sendEmail(APP_EMAIL, context);
              },
              child: const Card(
                child: ListTile(
                  leading: Icon(CupertinoIcons.mail),
                  title: Text(
                    APP_EMAIL,
                    style: TextStyle(fontSize: 18),
                  ),
                  trailing: Icon(CupertinoIcons.arrow_right_circle),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  sendEmail(String email, BuildContext context) async {
    try {
      await FlutterEmailSender.send(Email(
        recipients: [email],
        body: 'Please type your message',
        subject: 'Enter your Subject',
      ));
    } on PlatformException catch (exception) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(exception.message ?? "")));
    }
  }

  callNumber(String number, BuildContext context) async {
    String url = 'tel:${number}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Sorry, Calling ${number} Failed')));
    }
  }
}
