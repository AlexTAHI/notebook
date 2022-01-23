import 'package:flutter/material.dart';

List<double> getScreenSize(context) {
  return [
    MediaQuery.of(context).size.width,
    MediaQuery.of(context).size.height,
  ];
}
