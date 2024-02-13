import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quranapp/app/routes/app_pages.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.HOME);
              },
              child: Text("Quran"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.CHATBOT);
              },
              child: Text("Chatbot"),
            ),
          ],
        ),
      ),
    );
  }
}
