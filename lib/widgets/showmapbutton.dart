import 'package:flutter/material.dart';
import '../utils/colors.dart';

class ShowMapButton extends StatelessWidget {
  final ontap;
  ShowMapButton(this.ontap);
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            //border: Border.all(color: yellow),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 0.5),
                blurRadius: 5.0,
              ),
            ],
          ),
          height: 35,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(right: 20, bottom: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Icon(
                Icons.map,
                color: YELLOW,
                size: 15,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "View Map",
                style: TextStyle(color: YELLOW),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
