import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_emufassir/app/constant/theme.dart';

import 'custom_loading.dart';

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

  static void showLoadingDialog() {
    Get.dialog(const Center(
      child: CustomLoading(),
    ));
  }

  static void basicSnackbar(
      {String title = "Berhasil", String msg = "Teks berhasil disalin!"}) {
    Get.snackbar(title, msg,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white.withOpacity(0.8));
  }
}
