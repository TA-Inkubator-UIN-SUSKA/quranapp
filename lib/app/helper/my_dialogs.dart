import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_emufassir/app/constant/theme.dart';

class MyDialog {
  static void info(String msg) {
    Get.snackbar("Info", msg,
        backgroundColor: appGreen, colorText: Colors.white);
  }

  static void success(String msg) {
    Get.snackbar("Success", msg,
        backgroundColor: Colors.green.withOpacity(0.8),
        colorText: Colors.white);
  }

  static void error(String msg) {
    Get.snackbar("Error", msg,
        backgroundColor: Colors.red.withOpacity(0.8), colorText: Colors.white);
  }

  // static void showLoadingDialog() {
  //   Get.dialog(const Center(
  //     child: CustomLoading(),
  //   ));
  // }
}
