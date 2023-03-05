import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_surah_wbw_controller.dart';
import 'package:quranapp/app/constant/theme.dart';
import 'package:quranapp/app/data/models/word_chapter.dart';

class DetailSurahWbwView extends GetView<DetailSurahWbwController> {
  int idSurah = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: appGreenDark),
          title: Text(
            '${idSurah}. Al -Fatihah',
            style: TextStyle(
              color: appGreenDark,
            ),
          ),
          backgroundColor: appWhite,
          elevation: 0,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                color: appGreenDark,
              ),
            )
          ],
        ),
        body: FutureBuilder<List<WordChapter>>(
          future: controller.getWordVerses(idSurah),
          builder: (context, snapshot) {
            return ListView.builder(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                WordChapter? verse = snapshot.data?[index];
                int? lengthGrid = verse?.words?.length;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "${verse?.textUthmani}",
                      style: TextStyle(
                        color: appGreenDark,
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                      ),
                    ),
                    if (snapshot.hasData)
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 10,
                            crossAxisCount: 3,
                          ),
                          itemBuilder: (_, int indexGrid) {
                            Words? word = verse?.words?[indexGrid];

                            return Container(
                              decoration: BoxDecoration(
                                  color: appGreenLight,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "${indexGrid + 1}",
                                      style: TextStyle(fontSize: 10),
                                    ),
                                    Text("${word?.text}"),
                                    Text("${word?.transliteration?.text}"),
                                    Text("${word?.translation?.text}"),
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: lengthGrid! - 1,
                        ),
                      ),
                  ],
                );
              },
            );
          },
        ));
  }
}
