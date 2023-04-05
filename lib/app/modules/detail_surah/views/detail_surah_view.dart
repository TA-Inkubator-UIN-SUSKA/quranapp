import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:get/get.dart';
import 'package:quranapp/app/constant/theme.dart';
import 'package:quranapp/app/data/models/surah.dart';
import 'package:quranapp/app/data/models/verse.dart' as verse;
import 'package:quranapp/app/data/models/word.dart';
import 'package:quranapp/app/data/models/word_chapter.dart';
import 'package:quranapp/app/data/models/word_verse.dart' as wordverse;
import 'package:quranapp/app/modules/detail_surah/controllers/detail_surah_controller.dart';
import 'package:quranapp/app/modules/settings/controllers/settings_controller.dart';
import 'package:quranapp/app/routes/app_pages.dart';

class DetailSurahView extends GetView<DetailSurahController> {
  Surah surahArgument = Get.arguments;
  final settingC = Get.put(SettingsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: appGreenDark),
          title: Text(
            '${surahArgument.id}. ${surahArgument.name}',
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
        body: GetBuilder<DetailSurahController>(
          builder: (c) {
            if (c.isWBW) {
              return futureWBW();
            } else {
              return futureSurah();
            }
          },
        ));
  }

  FutureBuilder<List<verse.Verse>> futureSurah() {
    return FutureBuilder<List<verse.Verse>>(
      future: controller.getVerse(
          idSurah: surahArgument.id!,
          idReciter: settingC.idSelectedReciter,
          idTafsir: settingC.idSelectedTafsir),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
          children: [
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
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      '${surahArgument.name}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: appWhite,
                      ),
                    ),
                    Text(
                      '( ${surahArgument.translatedName?.translation} )',
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
                      '${surahArgument.verseCount ?? ''} Ayat | ${surahArgument.revelationPlace ?? ''}',
                      style: TextStyle(
                        fontSize: 16,
                        color: appWhite,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListView.builder(
              padding: EdgeInsets.only(top: 20),
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                verse.Verse? ayat = snapshot.data?[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
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
                            GetBuilder<DetailSurahController>(
                              builder: (c) => Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Get.dialog(Dialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                            c.playAudio(ayat);
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
            )
          ],
        );
      },
    );
  }

  FutureBuilder<List<wordverse.WordVerse>> futureWBW() {
    return FutureBuilder<List<wordverse.WordVerse>>(
      future: controller.getWordVerses(surahArgument.id!),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
          children: [
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
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      '${surahArgument.name}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: appWhite,
                      ),
                    ),
                    Text(
                      '( ${surahArgument.translatedName?.translation} )',
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
                      '${surahArgument.verseCount ?? ''} Ayat | ${surahArgument.revelationPlace ?? ''}',
                      style: TextStyle(
                        fontSize: 16,
                        color: appWhite,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListView.builder(
              padding: EdgeInsets.only(top: 20),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                wordverse.WordVerse? verse = snapshot.data?[index];
                int? lengthGrid = verse?.words?.length;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage("assets/images/hexagonal.png"),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "${index + 1}",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "${verse?.text?.textUthmani}",
                            textAlign: TextAlign.end,
                            softWrap: true,
                            style: TextStyle(
                              color: appGreenDark,
                              fontWeight: FontWeight.w500,
                              fontSize: 28,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "${verse?.transliteration}",
                      textAlign: TextAlign.end,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Html(data: verse?.translation?.text),
                    SizedBox(
                      height: 10,
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
                            var word = (verse!.words!)[indexGrid];

                            return GestureDetector(
                              onTap: () {
                                controller.playAudioWBW(word.audio!);
                                print(word.audio!);
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
                                      Text("${word.textUthmani}"),
                                      Text("${word.transliteration}"),
                                      Text(
                                        word.wordTranslations!.text!,
                                        style: TextStyle(fontSize: 10),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: lengthGrid!,
                        ),
                      ),
                  ],
                );
              },
            ),
          ],
        );
      },
    );
  }
}
