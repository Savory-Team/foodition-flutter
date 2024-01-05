import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  /// [MediaQuery] Get access to device width
  double get deviceWidth => MediaQuery.of(this).size.width;

  /// [MediaQuery] Get access to device height
  double get deviceHeight => MediaQuery.of(this).size.height;
}
