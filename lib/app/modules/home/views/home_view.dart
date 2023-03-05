import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quranapp/app/constant/theme.dart';
import 'package:quranapp/app/data/models/surah.dart';
import 'package:quranapp/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackground,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appBackground,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: appGreen,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.bookmark,
                    color: appGreenDark,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: appGreenDark,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: DefaultTabController(
          length: 2,
          child: FutureBuilder<List<Surah>>(
            future: controller.getResource(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              return Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
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
                      "Lutfi Aldri Permana",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                  "Al-Baqarah",
                                  style: TextStyle(
                                    color: appWhite,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  "Ayat 1",
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
                          ListView.builder(
                            itemCount: snapshot.data?.length,
                            itemBuilder: (context, index) {
                              Surah surah = snapshot.data![index];
                              return ListTile(
                                  onTap: () {
                                    Get.toNamed(Routes.DETAIL_SURAH_WBW, arguments: index+1);
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
                                  title: Text("${surah.nameComplex}"),
                                  subtitle: Text(
                                    "${surah.revelationPlace} - ${surah.translatedName?.name} - ${surah.versesCount} Ayat",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  trailing: Text("${surah.nameArabic}"));
                            },
                          ),
                          ListView.builder(
                            itemCount: 30,
                            itemBuilder: (context, index) {
                              Surah surah = snapshot.data![index];
                              return ListTile(
                                onTap: () {
                                  Get.toNamed(Routes.DETAIL_JUZ);
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
                                      "Start : Al-Fatihah - 1",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                      "End : Al-Baqarah - 141",
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
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          )),
    );
  }
}
