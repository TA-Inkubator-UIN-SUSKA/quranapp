import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quranapp/app/constant/theme.dart';
import 'package:quranapp/app/modules/detail_surah/controllers/detail_surah_controller.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  final detailSurahC = Get.find<DetailSurahController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: appGreenDark),
        title: Text(
          'Settings',
          style: TextStyle(
            color: appGreenDark,
          ),
        ),
        backgroundColor: appWhite,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text("Kata per Kata"),
          GetBuilder<SettingsController>(
            builder: (_) {
              return Switch(
                value: controller.isWBW,
                onChanged: (value) {
                  detailSurahC.isWBW = value;
                  detailSurahC.update();
                  controller.changeSwitchWBW(value);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
