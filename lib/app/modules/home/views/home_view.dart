import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quranapp/app/constant/theme.dart';
import 'package:quranapp/app/data/models/juz.dart';
import 'package:quranapp/app/data/models/surah.dart';
import 'package:quranapp/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackground,
      // appBar: AppBar(
      //   backgroundColor: appGreen,
      //   title: Text(
      //     "QuranType",
      //   ),
      //   centerTitle: true,
      // ),
      body: SafeArea(
        child: DefaultTabController(
            length: 2,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Assalamualaikum",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Muslimin/Muslimat",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 20),
                  GetBuilder<HomeController>(
                    builder: (c) {
                      return FutureBuilder<Map<String, dynamic>?>(
                        future: controller.getLastRead(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                  colors: [
                                    appGreen.withOpacity(0.8),
                                    appGreenDark,
                                  ],
                                ),
                              ),
                              width: Get.width,
                              child: Stack(
                                children: [
                                  Positioned(
                                    bottom: -50,
                                    right: 0,
                                    child: Opacity(
                                      opacity: 0.8,
                                      child: Container(
                                        height: 160,
                                        width: 160,
                                        child: Image.asset(
                                          'assets/images/Quran.png',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.menu_book_rounded,
                                              color: appWhite,
                                            ),
                                            Text(
                                              "  Last Read",
                                              style: TextStyle(
                                                color: appWhite,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Text(
                                          "Loading...",
                                          style: TextStyle(
                                            color: appWhite,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                          Map<String, dynamic>? lastRead = snapshot.data;
                          return Material(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                    colors: [
                                      appGreen.withOpacity(0.8),
                                      appGreenDark,
                                    ],
                                  ),
                                ),
                                width: Get.width,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      bottom: -20,
                                      right: 10,
                                      child: Opacity(
                                        opacity: 0.8,
                                        child: Container(
                                          height: 160,
                                          width: 160,
                                          child: Image.asset(
                                            'assets/images/Quran.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.menu_book_rounded,
                                                color: appWhite,
                                              ),
                                              Text(
                                                "  Last Read",
                                                style: TextStyle(
                                                  color: appWhite,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Text(
                                            lastRead?["surah"]
                                                    .toString()
                                                    .replaceAll("+", "'") ??
                                                "null",
                                            style: TextStyle(
                                              color: appWhite,
                                              fontSize: 20,
                                            ),
                                          ),
                                          Text(
                                            "Ayat ${lastRead?["ayat"] ?? "null"}",
                                            style: TextStyle(
                                              color: appWhite,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                switch (lastRead!["via"]) {
                                  // case "juz":
                                  //   Map<String, dynamic> dataMapPerJuz =
                                  //       controller.allJuz[lastRead["juz"] - 1];
                                  //   Get.toNamed(Routes.DETAIL_JUZ, arguments: {
                                  //     "juz": dataMapPerJuz,
                                  //     "bookmark": lastRead,
                                  //   });
      
                                  //   break;
                                  default:
                                    Get.toNamed(Routes.DETAIL_SURAH, arguments: {
                                      "name": lastRead["surah"]
                                          .toString()
                                          .replaceAll("+", "'"),
                                      "number": lastRead["number_surah"],
                                      "bookmark": lastRead,
                                    });
                                }
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: appWhite,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            offset: Offset(0.0, 0.5),
                            blurRadius: 0.5,
                          )
                        ]),
                    child: TabBar(
                      indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(color: appGreen2, width: 3),
                        insets: EdgeInsets.symmetric(horizontal: 60),
                      ),
                      labelColor: appGreenDark,
                      labelStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      unselectedLabelStyle:
                          TextStyle(fontWeight: FontWeight.w400),
                      unselectedLabelColor: Colors.grey.shade600,
                      labelPadding: EdgeInsets.all(2),
                      tabs: [
                        Tab(
                          text: "Surah",
                        ),
                        Tab(
                          text: "Juz",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
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
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return ListView.builder(
                              itemCount: snapshot.data?.length,
                              itemBuilder: (context, index) {
                                Surah surah = snapshot.data![index];
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
                                      child: Center(child: Text("${index + 1}")),
                                    ),
                                    title: Text("${surah.name}"),
                                    subtitle: Text(
                                      "${surah.revelationPlace} - ${surah.translatedName?.translation} - ${surah.verseCount} Ayat",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    trailing: Text("${surah.arabicName}"));
                              },
                            );
                          },
                        ),
                        FutureBuilder<List<Juz>>(
                          future: controller.getJuzs(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return ListView.builder(
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
                                        "Start : ${juz.juzStartInfo}",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      Text(
                                        "End : ${juz.juzEndInfo}",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                  trailing: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.more_vert),
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
            )),
      ),
    );
  }
}
