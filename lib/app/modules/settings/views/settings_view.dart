import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../constant/theme.dart';
import '../../../helper/custom_loading.dart';
import '../../../modules/detail_juz/controllers/detail_juz_controller.dart';
import '../../../modules/detail_surah/controllers/detail_surah_controller.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  final detailSurahC = Get.put(DetailSurahController());
  final detailJuzc = Get.put(DetailJuzController());

  SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: appWhite),
        title: const Text(
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
          // controller.getTafsirs(),
        ]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CustomLoading(),
            );
          }
          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
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
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Pilih Qari",
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
              GetBuilder<SettingsController>(
                builder: (c) {
                  return DropdownButtonFormField(
                    isExpanded: true,
                    value: c.idSelectedReciter,
                    hint: Text(
                        c.allReciters[c.idSelectedReciter - 1].reciterName ??
                            "null"),
                    items: [
                      for (int i = 0; i <= c.allReciters.length - 1; i++)
                        DropdownMenuItem(
                          value: i + 1,
                          child: Text(
                              "${c.allReciters[i].reciterName ?? "null"} - ${c.allReciters[i].style == "" ? "Murattal" : c.allReciters[i].style}"),
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
              const SizedBox(
                height: 20,
              ),
              const Text(
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
                          value: c.allTafsirs[i].id,
                          onTap: () {
                            c.indexSelectedTafsir = i;
                            c.selectedIDController.write("indexTafsir", i);
                            // print(i);
                          },
                          child: Text(
                            c.allTafsirs[i].name ?? "null",
                            overflow: TextOverflow.ellipsis,
                          ),
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
              const SizedBox(
                height: 20,
              ),
              const Text(
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
                          value: i,
                          onTap: () {
                            c.indexSelectedStyle = i;
                            c.selectedIDController.write("indexStyle", i);
                          },
                          child: Text(
                            c.allStyle[i],
                            overflow: TextOverflow.ellipsis,
                          ),
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
