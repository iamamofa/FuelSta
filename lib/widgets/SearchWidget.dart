// ignore: file_names
// ignore_for_file: file_names
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final Function()? onInputTap;
  SearchWidget({this.onInputTap});
  final TextEditingController editingController = TextEditingController();
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 10),
      child: Material(
        borderRadius: const BorderRadius.all(Radius.circular(25.0)),
        elevation: 2.0,
        child: Container(
          height: 45.0,
          margin: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: onInputTap != null
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.text,
                        maxLines: 1,
                        onTap: onInputTap,
                        readOnly: true,
                        decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.search,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            hintText: "Search",
                            border: InputBorder.none),
                        onSubmitted: null,
                        controller: editingController,
                      ),
                    ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.text,
                        maxLines: 1,
                        decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.search,
                              color: Theme.of(context).accentColor,
                            ),
                            hintText: "Search",
                            border: InputBorder.none),
                        onSubmitted: null,
                        controller: editingController,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
