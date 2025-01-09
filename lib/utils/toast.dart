import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toast {
  Toast._();

  static show(String message) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.TOP,
    );
  }

  static showError(String message) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.TOP,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }
}
