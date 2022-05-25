import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:slider_using_pageview/ui/styles/styles.dart';

class MovieBox extends StatelessWidget {
  final String url;
  final double scale;
  const MovieBox({Key? key, required this.url, required this.scale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Parent(
      style: parentStyle.clone()
        ..background.image(
          url: url,
          fit: BoxFit.cover,
        )
        ..width(200 * scale)
        ..height(300 * scale),
    );
  }
}
