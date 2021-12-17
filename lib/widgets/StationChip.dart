// ignore: file_names
// ignore_for_file: file_names
import 'package:flutter/material.dart';
import '../models/Product.dart';
import '../utils/colors.dart';

// ignore: must_be_immutable
class StationChip extends StatelessWidget {
  Product product;
  StationChip(this.product, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: Chip(
        labelPadding:
            const EdgeInsets.only(top: 1, bottom: 1, left: 3, right: 3),
        avatar: CircleAvatar(
          backgroundColor: YELLOW,
          child: Text(
            product.name![0],
            style: const TextStyle(fontSize: 8, color: RED),
          ),
        ),
        label: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              product.name ?? "",
              style: const TextStyle(fontSize: 12),
            ),
            Text(" - " + product.price! + "/" + product.units!)
          ],
        ),
      ),
    );
  }
}
