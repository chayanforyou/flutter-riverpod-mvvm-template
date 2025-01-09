import 'package:flutter/material.dart';

extension NavigatorExtensions on BuildContext {
  NavigatorState get nav {
    return Navigator.of(this);
  }
}
