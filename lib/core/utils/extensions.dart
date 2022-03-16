import 'package:flutter/cupertino.dart';

extension BuildContextExtensions on BuildContext {
  double screenHeight([double percent = 1]) => percent * _height;
  double screenWidth([double percent = 1]) => percent * _width;
  double get _height => MediaQuery.of(this).size.height;
  double get _width => MediaQuery.of(this).size.width;
}
