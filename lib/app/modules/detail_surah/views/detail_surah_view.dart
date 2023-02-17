import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quranapp/app/constant/theme.dart';
import 'package:quranapp/app/data/models/verse.dart';
import 'package:quranapp/app/data/models/word_chapter.dart';

import '../controllers/detail_surah_controller.dart';

class DetailSurahView extends GetView<DetailSurahController> {
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
              itemCount: 7,
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
                // return ListView.builder(
                //   shrinkWrap: true,
                //   physics: ClampingScrollPhysics(),
                //   scrollDirection: Axis.horizontal,
                //   itemCount: 5,
                //   itemBuilder: (context, index) {
                //     return Column(
                //       mainAxisSize: MainAxisSize.min,
                //       children: [
                //         Text("بِسْمِ"),
                //         Text("bismi"),
                //         Text("dengan menyebut"),
                //       ],
                //     );
                //   },
                // );
                // return GridView.count(
                //   shrinkWrap: true,
                //   physics: NeverScrollableScrollPhysics(),
                //   crossAxisCount: 5,
                //   children: [
                //     Column(
                //       mainAxisSize: MainAxisSize.min,
                //       children: [
                //         Text("بِسْمِ"),
                //         Text("bismi"),
                //         Text("dengan menyebut"),
                //       ],
                //     ),
                //     Column(
                //       mainAxisSize: MainAxisSize.min,
                //       children: [
                //         Text("بِسْمِ"),
                //         Text("bismi"),
                //         Text("dengan menyebut"),
                //       ],
                //     ),
                //     Column(
                //       mainAxisSize: MainAxisSize.min,
                //       children: [
                //         Text("بِسْمِ"),
                //         Text("bismi"),
                //         Text("dengan menyebut"),
                //       ],
                //     ),
                //     Column(
                //       mainAxisSize: MainAxisSize.min,
                //       children: [
                //         Text("بِسْمِ"),
                //         Text("bismi"),
                //         Text("dengan menyebut"),
                //       ],
                //     ),
                //   ],
                // );
              },
            );
          },
        ));
  }
}
