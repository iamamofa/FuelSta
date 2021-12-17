// ignore: file_names
// ignore_for_file: file_names
import 'package:flutter/material.dart';
import '../utils/colors.dart';

class Retry extends StatelessWidget {
  final VoidCallback tryAgain;
  final IconData icon;
  final String buttontext;
  final String errormessage;
  final bool showbtn;

  Retry(
      {required Key key,
      required this.tryAgain,
      required this.icon,
      this.buttontext = "",
      this.errormessage = "",
      this.showbtn = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 8.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              size: 80.0,
              color: YELLOW,
            ),
            Text(
              errormessage,
              style: const TextStyle(
                fontSize: 18.0,
              ),
              textAlign: TextAlign.center,
            ),
            if (showbtn)
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: OutlinedButton(
                  onPressed: tryAgain,
                  child: Text(buttontext),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
