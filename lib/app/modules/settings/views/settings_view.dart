import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quranapp/app/constant/theme.dart';
import 'package:quranapp/app/data/models/tafsir.dart';
import 'package:quranapp/app/modules/detail_juz/controllers/detail_juz_controller.dart';
import 'package:quranapp/app/modules/detail_surah/controllers/detail_surah_controller.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  final detailSurahC = Get.put(DetailSurahController());
  final detailJuzc = Get.put(DetailJuzController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: appWhite),
        title: Text(
          'Settings',
          style: TextStyle(
            color: appWhite,
          ),
        ),
        backgroundColor: appGreen,
        elevation: 0,
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: Future.wait([
          controller.getReciter(),
          controller.getTafsirs(),
        ]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            padding: EdgeInsets.all(20),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Kata per Kata",
                    style: TextStyle(fontSize: 16),
                  ),
                  GetBuilder<SettingsController>(
                    builder: (_) {
                      return Switch(
                        value: controller.isWBW,
                        onChanged: (value) {
                          detailSurahC.isWBW = value;
                          detailSurahC.update();
                          detailJuzc.isWBW = value;
                          detailJuzc.update();
                          controller.changeSwitchWBW(value);
                        },
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Pilih Qari",
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
              GetBuilder<SettingsController>(
                builder: (c) {
                  return DropdownButtonFormField(
                    value: c.idSelectedReciter,
                    hint: Text(
                        c.allReciters[c.idSelectedReciter - 1].reciterName ??
                            "null"),
                    items: [
                      for (int i = 0; i <= c.allReciters.length - 1; i++)
                        DropdownMenuItem(
                          child: Text(
                              "${c.allReciters[i].reciterName ?? "null"} - ${c.allReciters[i].style == "" ? "Murattal" : c.allReciters[i].style}"),
                          value: i + 1,
                        ),
                    ],
                    onChanged: (value) {
                      c.selectIDReciter(value ?? 6);
                      detailSurahC.update();
                      detailJuzc.update();
                    },
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Pilih Tafsir",
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
              GetBuilder<SettingsController>(
                builder: (c) {
                  return DropdownButtonFormField(
                    isExpanded: true,
                    value: c.idSelectedTafsir,
                    hint: Text(
                      c.allTafsirs[c.indexSelectedTafsir].name ?? "null",
                      overflow: TextOverflow.ellipsis,
                    ),
                    items: [
                      for (int i = 0; i <= c.allTafsirs.length - 1; i++)
                        DropdownMenuItem(
                          child: Text(
                            "${c.allTafsirs[i].name ?? "null"} - ${c.allTafsirs[i].authorName ?? "null"} - ${c.allTafsirs[i].languageName}",
                            overflow: TextOverflow.ellipsis,
                          ),
                          value: c.allTafsirs[i].id,
                          onTap: () {
                            c.indexSelectedTafsir = i;
                            c.selectedIDController.write("indexTafsir", i);
                            print(i);
                          },
                        ),
                    ],
                    onChanged: (value) {
                      c.selectIDTafsir(value ?? 1);
                      detailSurahC.update();
                      detailJuzc.update();
                    },
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Pilih Style Penulisan Al-Quran",
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
              GetBuilder<SettingsController>(
                builder: (c) {
                  return DropdownButtonFormField(
                    isExpanded: true,
                    value: c.indexSelectedStyle,
                    hint: Text(
                      c.allStyle[c.indexSelectedStyle] ?? "null",
                      overflow: TextOverflow.ellipsis,
                    ),
                    items: [
                      for (int i = 0; i <= c.allStyle.length - 1; i++)
                        DropdownMenuItem(
                          child: Text(
                            c.allStyle[i],
                            overflow: TextOverflow.ellipsis,
                          ),
                          value: i,
                          onTap: () {
                            c.indexSelectedStyle = i;
                            c.selectedIDController.write("indexStyle", i);
                          },
                        ),
                    ],
                    onChanged: (value) {
                      c.selectStyle(value ?? 0);
                      detailSurahC.update();
                      detailJuzc.update();
                    },
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
