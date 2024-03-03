import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/theme.dart';
import '../../../data/models/juz.dart';
import '../../../data/models/surah.dart';
import '../../../helper/custom_loading.dart';
import '../../../routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final search = ''.obs;

  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: appGreenDark),
        title: const Text(
          "Al-Qur'an Indonesia",
          style: TextStyle(color: appGreenDark),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.SETTINGS);
            },
            icon: const Icon(
              Icons.settings,
              color: appGreenDark,
            ),
          )
        ],
      ),
      backgroundColor: appBackground,
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: SizedBox(
                  height: 32,
                  child: Align(
                    alignment: Alignment.center,
                    child: TabBar(
                      isScrollable: true,
                      labelPadding:
                          EdgeInsets.symmetric(horizontal: mq.width * 0.15),
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorWeight: 3,
                      indicator: const UnderlineTabIndicator(
                        borderSide: BorderSide(color: appGreen, width: 3),
                      ),
                      labelColor: appGreen,
                      labelStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      unselectedLabelStyle:
                          const TextStyle(fontWeight: FontWeight.w400),
                      unselectedLabelColor: Colors.grey.shade600,
                      tabs: const [
                        Tab(
                          text: "Surah",
                        ),
                        Tab(
                          text: "Juz",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    FutureBuilder<List<Surah>>(
                      future: controller.getSurahs(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CustomLoading(),
                          );
                        }
                        return Column(
                          children: [
                            SizedBox(
                              width: mq.width * 0.9,
                              child: TextFormField(
                                onChanged: (s) =>
                                    search.value = s.toLowerCase(),
                                maxLines: null,
                                onTapOutside: (event) =>
                                    FocusScope.of(context).unfocus(),
                                decoration: const InputDecoration(
                                  suffixIcon: Icon(CupertinoIcons.search),
                                  hintText: "Cari Surah atau Arti Surah...",
                                  hintStyle: TextStyle(
                                    fontSize: 12,
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  isDense: true,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Obx(() {
                                List<Surah> listSurah = search.isEmpty
                                    ? controller.listSurah
                                    : controller.listSurah
                                        .where((surah) =>
                                            surah.name!
                                                .toLowerCase()
                                                .contains(search.value) ||
                                            surah.translatedName!.translation!
                                                .toLowerCase()
                                                .contains(search.value))
                                        .toList();
                                return ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: listSurah.length,
                                  itemBuilder: (context, index) {
                                    Surah surah = listSurah[index];
                                    return ListTile(
                                        onTap: () {
                                          Get.toNamed(Routes.DETAIL_SURAH,
                                              arguments: {"surah": surah});
                                        },
                                        leading: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              color: appGreenLight,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Center(
                                              child: Text("${index + 1}")),
                                        ),
                                        title: Text("${surah.name}"),
                                        subtitle: Text(
                                          "${surah.translatedName?.translation} - ${surah.verseCount} Ayat",
                                          style: const TextStyle(fontSize: 12),
                                        ),
                                        trailing: Text("${surah.arabicName}"));
                                  },
                                );
                              }),
                            ),
                          ],
                        );
                      },
                    ),
                    FutureBuilder<List<Juz>>(
                      future: controller.getJuzs(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CustomLoading(),
                          );
                        }
                        return ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: 30,
                          itemBuilder: (context, index) {
                            Juz juz = snapshot.data![index];
                            return ListTile(
                              onTap: () {
                                Get.toNamed(Routes.DETAIL_JUZ,
                                    arguments: juz.id);
                              },
                              isThreeLine: true,
                              leading: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: appGreenLight,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(child: Text("${index + 1}")),
                              ),
                              title: Text("Juz ${index + 1}"),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Mulai : ${juz.juzStartInfo}",
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    "Akhir : ${juz.juzEndInfo}",
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    juz.name ?? "null",
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.black54),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
