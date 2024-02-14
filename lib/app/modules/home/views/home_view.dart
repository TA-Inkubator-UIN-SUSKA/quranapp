import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranapp/app/constant/theme.dart';
import 'package:quranapp/app/data/models/juz.dart';
import 'package:quranapp/app/data/models/surah.dart';
import 'package:quranapp/app/routes/app_pages.dart';

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
          'Quran',
          style: TextStyle(color: appGreenDark),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: appBackground,
      body: SafeArea(
        child: DefaultTabController(
            length: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // BANNER

                // GetBuilder<HomeController>(
                //   builder: (c) {
                //     return FutureBuilder<Map<String, dynamic>?>(
                //       future: controller.getLastRead(),
                //       builder: (context, snapshot) {
                //         if (snapshot.connectionState ==
                //             ConnectionState.waiting) {
                //           return Container(
                //             decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(20),
                //               gradient: LinearGradient(
                //                 colors: [
                //                   appGreen.withOpacity(0.8),
                //                   appGreenDark,
                //                 ],
                //               ),
                //             ),
                //             width: Get.width,
                //             child: Stack(
                //               children: [
                //                 Positioned(
                //                   bottom: -50,
                //                   right: 0,
                //                   child: Opacity(
                //                     opacity: 0.8,
                //                     child: SizedBox(
                //                       height: 160,
                //                       width: 160,
                //                       child: Image.asset(
                //                         'assets/images/Quran.png',
                //                         fit: BoxFit.contain,
                //                       ),
                //                     ),
                //                   ),
                //                 ),
                //                 const Padding(
                //                   padding: EdgeInsets.all(20.0),
                //                   child: Column(
                //                     crossAxisAlignment:
                //                         CrossAxisAlignment.start,
                //                     children: [
                //                       Row(
                //                         children: [
                //                           Icon(
                //                             Icons.menu_book_rounded,
                //                             color: appWhite,
                //                           ),
                //                           Text(
                //                             "  Last Read",
                //                             style: TextStyle(
                //                               color: appWhite,
                //                             ),
                //                           ),
                //                         ],
                //                       ),
                //                       SizedBox(
                //                         height: 30,
                //                       ),
                //                       Text(
                //                         "Loading...",
                //                         style: TextStyle(
                //                           color: appWhite,
                //                           fontSize: 20,
                //                         ),
                //                       ),
                //                     ],
                //                   ),
                //                 ),
                //               ],
                //             ),
                //           );
                //         }
                //         Map<String, dynamic>? lastRead = snapshot.data;
                //         return Material(
                //           borderRadius: BorderRadius.circular(20),
                //           color: Colors.transparent,
                //           child: InkWell(
                //             borderRadius: BorderRadius.circular(20),
                //             child: Container(
                //               decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(20),
                //                 gradient: LinearGradient(
                //                   colors: [
                //                     appGreen.withOpacity(0.8),
                //                     appGreenDark,
                //                   ],
                //                 ),
                //               ),
                //               width: Get.width,
                //               child: Stack(
                //                 children: [
                //                   Positioned(
                //                     bottom: -20,
                //                     right: 10,
                //                     child: Opacity(
                //                       opacity: 0.8,
                //                       child: SizedBox(
                //                         height: 160,
                //                         width: 160,
                //                         child: Image.asset(
                //                           'assets/images/Quran.png',
                //                           fit: BoxFit.cover,
                //                         ),
                //                       ),
                //                     ),
                //                   ),
                //                   Padding(
                //                     padding: const EdgeInsets.all(20.0),
                //                     child: Column(
                //                       crossAxisAlignment:
                //                           CrossAxisAlignment.start,
                //                       children: [
                //                         const Row(
                //                           children: [
                //                             Icon(
                //                               Icons.menu_book_rounded,
                //                               color: appWhite,
                //                             ),
                //                             Text(
                //                               "  Last Read",
                //                               style: TextStyle(
                //                                 color: appWhite,
                //                               ),
                //                             ),
                //                           ],
                //                         ),
                //                         const SizedBox(
                //                           height: 30,
                //                         ),
                //                         Text(
                //                           lastRead?["surah"]
                //                                   .toString()
                //                                   .replaceAll("+", "'") ??
                //                               "null",
                //                           style: const TextStyle(
                //                             color: appWhite,
                //                             fontSize: 20,
                //                           ),
                //                         ),
                //                         Text(
                //                           "Ayat ${lastRead?["ayat"] ?? "null"}",
                //                           style: const TextStyle(
                //                             color: appWhite,
                //                             fontSize: 16,
                //                           ),
                //                         ),
                //                       ],
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //             onTap: () {
                //               switch (lastRead!["via"]) {
                //                 // case "juz":
                //                 //   Map<String, dynamic> dataMapPerJuz =
                //                 //       controller.allJuz[lastRead["juz"] - 1];
                //                 //   Get.toNamed(Routes.DETAIL_JUZ, arguments: {
                //                 //     "juz": dataMapPerJuz,
                //                 //     "bookmark": lastRead,
                //                 //   });

                //                 //   break;
                //                 default:
                //                   Get.toNamed(Routes.DETAIL_SURAH,
                //                       arguments: {
                //                         "name": lastRead["surah"]
                //                             .toString()
                //                             .replaceAll("+", "'"),
                //                         "number": lastRead["number_surah"],
                //                         "bookmark": lastRead,
                //                       });
                //               }
                //             },
                //           ),
                //         );
                //       },
                //     );
                //   },
                // ),

                Container(
                  decoration: BoxDecoration(
                    // color: appWhite,
                    borderRadius: BorderRadius.circular(18),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.grey.shade400,
                    //     offset: const Offset(0.0, 0.5),
                    //     blurRadius: 0.5,
                    //   )
                    // ],
                  ),
                  child: SizedBox(
                    height: 32,
                    child: Align(
                      alignment: Alignment.center,
                      child: TabBar(
                        isScrollable: true,
                        // padding:
                        //     EdgeInsets.symmetric(horizontal: mq.width * 0.4),
                        // indicatorPadding: EdgeInsets.zero,
                        labelPadding:
                            EdgeInsets.symmetric(horizontal: mq.width * 0.15),
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorWeight: 3,
                        indicator: const UnderlineTabIndicator(
                          borderSide: BorderSide(color: appGreen, width: 3),
                          // insets: EdgeInsets.symmetric(horizontal: 30),
                        ),
                        labelColor: appGreen,
                        labelStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        unselectedLabelStyle:
                            const TextStyle(fontWeight: FontWeight.w400),
                        unselectedLabelColor: Colors.grey.shade600,
                        // labelPadding: const EdgeInsets.all(2),
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
                              child: CircularProgressIndicator(),
                            );
                          }
                          return Column(
                            children: [
                              SizedBox(
                                width: mq.width * 0.9,
                                child: TextFormField(
                                  onChanged: (s) =>
                                      search.value = s.toLowerCase(),
                                  // controller: _c.resultC,
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
                                            style:
                                                const TextStyle(fontSize: 12),
                                          ),
                                          trailing:
                                              Text("${surah.arabicName}"));
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
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                      "End : ${juz.juzEndInfo}",
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                                trailing: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.more_vert),
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
            )),
      ),
    );
  }
}
