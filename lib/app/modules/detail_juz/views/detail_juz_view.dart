import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:get/get.dart';
import 'package:quranapp/app/constant/theme.dart';
import 'package:quranapp/app/data/models/surah.dart';
import 'package:quranapp/app/data/models/verse.dart' as verse;
import 'package:quranapp/app/data/models/word_chapter.dart';
import 'package:quranapp/app/modules/settings/controllers/settings_controller.dart';
import 'package:quranapp/app/routes/app_pages.dart';

import '../controllers/detail_juz_controller.dart';

class DetailJuzView extends GetView<DetailJuzController> {
  final settingC = Get.put(SettingsController());
  List<Surah> listSurah = [];
  int idJuz = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: appGreenDark),
          title: Text(
            'Juz $idJuz',
            style: TextStyle(
              color: appGreenDark,
            ),
          ),
          backgroundColor: appWhite,
          elevation: 0,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed(Routes.SETTINGS);
              },
              icon: Icon(
                Icons.settings,
                color: appGreenDark,
              ),
            )
          ],
        ),
        body: FutureBuilder<List<Surah>>(
          future: controller.getSurahs(),
          builder: (context, snapshot) {
            listSurah = snapshot.data ?? [];
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return GetBuilder<DetailJuzController>(
              builder: (c) {
                if (c.isWBW) {
                  return futureWBW();
                } else {
                  return futureSurah();
                }
              },
            );
          },
        ));
  }

  FutureBuilder<List<verse.Verse>> futureSurah() {
    return FutureBuilder<List<verse.Verse>>(
      future: controller.getVerse(
          idJuz: idJuz,
          idReciter: settingC.idSelectedReciter,
          idTafsir: settingC.idSelectedTafsir),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: snapshot.data?.length,
          itemBuilder: (context, index) {
            verse.Verse? ayat = snapshot.data?[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (ayat?.numberInChapter == 1)
                  Container(
                    width: Get.width,
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          appGreen.withOpacity(0.8),
                          appGreenDark,
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text(
                            '${listSurah[ayat!.idChapter! - 1].name}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: appWhite,
                            ),
                          ),
                          Text(
                            '( ${listSurah[ayat.idChapter! - 1].translatedName?.translation} )',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: appWhite,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${listSurah[ayat.idChapter! - 1].verseCount ?? ''} Ayat | ${listSurah[ayat.idChapter! + 1].revelationPlace ?? ''}',
                            style: TextStyle(
                              fontSize: 16,
                              color: appWhite,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                Container(
                  decoration: BoxDecoration(
                    color: appGreenLight,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 10.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: appGreen,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              "${index + 1}",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        GetBuilder<DetailJuzController>(
                          builder: (c) => Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Get.dialog(Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.all(20),
                                      child: ListView(
                                        children: [
                                          Text(
                                            "Tafsir Ayat ${index + 1}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(height: 20),
                                          Html(
                                              data: ayat?.tafsir?.text ??
                                                  'Tidak ada tafsir'),
                                        ],
                                      ),
                                    ),
                                  ));
                                },
                                icon: Icon(Icons.info_outline),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.bookmark_add_outlined,
                                ),
                              ),
                              (ayat?.kondisiAudio == "stop")
                                  ? IconButton(
                                      onPressed: () {
                                        c.playAudio(ayat!);
                                      },
                                      icon: Icon(
                                        Icons.play_arrow,
                                      ),
                                    )
                                  : Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        (ayat?.kondisiAudio == "playing")
                                            ? IconButton(
                                                onPressed: () {
                                                  c.pauseAudio(ayat!);
                                                },
                                                icon: Icon(
                                                  Icons.pause,
                                                ),
                                              )
                                            : IconButton(
                                                onPressed: () {
                                                  c.resumeAudio(ayat!);
                                                },
                                                icon: Icon(
                                                  Icons.play_arrow,
                                                ),
                                              ),
                                        IconButton(
                                          onPressed: () {
                                            c.stopAudio(ayat!);
                                          },
                                          icon: Icon(Icons.stop),
                                        ),
                                      ],
                                    ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "${ayat?.text?.textUthmani ?? "null"}",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${ayat?.transliteration ?? "null"}",
                  style: TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.right,
                ),
                SizedBox(
                  height: 20,
                ),
                Html(data: ayat?.translation?.text),
                // Text(
                //   "${ayat?.translation?.text ?? "null"}",
                //   style: TextStyle(
                //     fontSize: 14,
                //   ),
                //   textAlign: TextAlign.right,
                // ),
                SizedBox(
                  height: 20,
                ),
              ],
            );
          },
        );
      },
    );
  }

  FutureBuilder<List<WordChapter>> futureWBW() {
    return FutureBuilder<List<WordChapter>>(
      future: controller.getWordVerses(idJuz),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
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
                  "text",
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
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 10,
                        crossAxisCount: 3,
                      ),
                      itemBuilder: (_, int indexGrid) {
                        Words? word = verse?.words?[indexGrid];

                        return GestureDetector(
                          onTap: () {
                            controller.playAudioWBW(word!.audioUrl!);
                            print(word.audioUrl);
                          },
                          child: Container(
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
                                  Text(
                                    "${word?.translation?.text}",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
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
    );
  }
}
