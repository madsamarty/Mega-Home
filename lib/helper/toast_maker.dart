import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastMaker {
  showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  /* showSnackBar(String message) {
    Get.snackbar(message, message, snackPosition: SnackPosition.BOTTOM);
  }

  showSnackBarWithError(String message, error) {
    Get.snackbar(message, error.toString(),
        snackPosition: SnackPosition.BOTTOM);
  } */
}
