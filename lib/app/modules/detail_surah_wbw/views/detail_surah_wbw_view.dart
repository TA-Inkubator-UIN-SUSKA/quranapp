import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_surah_wbw_controller.dart';
import 'package:quranapp/app/constant/theme.dart';
import 'package:quranapp/app/data/models/word_chapter.dart';

class DetailSurahWbwView extends GetView<DetailSurahWbwController> {
  int idSurah = 1;

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
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                WordChapter? verse = snapshot.data?[index];
                int? lengthGrid = verse?.words?.length;
                return Column(
                  children: [
                    Text("${verse?.verseNumber}. ${verse?.textUthmani}"),
                    if (snapshot.hasData)
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3),
                          itemBuilder: (_, int indexGrid) {
                            Words? word = verse?.words?[indexGrid];

                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("${word?.position}"),
                                Text("${word?.text}"),
                                Text("${word?.transliteration?.text}"),
                                Text("${word?.translation?.text}"),
                              ],
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
