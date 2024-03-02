import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:share_plus/share_plus.dart';
import '../../../constant/theme.dart';
import '../../../data/models/surah.dart';
import '../../../data/models/verse.dart' as verse;
import '../../../data/models/word_verse.dart' as wordverse;
import '../../../helper/custom_loading.dart';
import '../../../modules/settings/controllers/settings_controller.dart';
import '../../dashboard/controllers/dashboard_controller.dart';
import '../controllers/detail_juz_controller.dart';

class DetailJuzView extends GetView<DetailJuzController> {
  final dashboardC = Get.find<DashboardController>();
  final settingC = Get.put(SettingsController());
  final int idJuz = Get.arguments;
  static List<Surah> listSurah = [];

  DetailJuzView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: appGreenDark),
          title: Text(
            'Juz $idJuz',
            style: const TextStyle(
              color: appGreenDark,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: FutureBuilder<List<Surah>>(
          future: controller.getSurahs(),
          builder: (context, snapshot) {
            listSurah = snapshot.data ?? [];
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CustomLoading(),
              );
            }
            return Builder(
                builder: (c) => settingC.isWBW ? futureWBW() : futureSurah());
          },
        ));
  }

  // Future Surah
  FutureBuilder<List<verse.Verse>> futureSurah() {
    return FutureBuilder<List<verse.Verse>>(
      future: controller.getVerse(
          idJuz: idJuz,
          idReciter: settingC.idSelectedReciter,
          idTafsir: settingC.idSelectedTafsir),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CustomLoading(),
          );
        }
        return ListView.builder(
          controller: controller.scrollC,
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: snapshot.data?.length,
          itemBuilder: (context, index) {
            verse.Verse? ayat = snapshot.data?[index];
            return AutoScrollTag(
              controller: controller.scrollC,
              index: index,
              key: const ValueKey(0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (ayat?.numberInChapter == 1)
                    Container(
                      width: Get.width,
                      margin: const EdgeInsets.only(bottom: 20),
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
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: appWhite,
                              ),
                            ),
                            Text(
                              '( ${listSurah[ayat.idChapter! - 1].translatedName?.translation} )',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: appWhite,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${listSurah[ayat.idChapter! - 1].verseCount ?? ''} Ayat | ${listSurah[ayat.idChapter! + 1].revelationPlace ?? ''}',
                              style: const TextStyle(
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
                                style: const TextStyle(
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
                                    Get.dialog(
                                      Dialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Container(
                                          height: mq.height * 0.7,
                                          padding: const EdgeInsets.all(7),
                                          child: Scrollbar(
                                            thumbVisibility: true,
                                            child: ListView(
                                              padding: const EdgeInsets.all(16),
                                              physics:
                                                  const BouncingScrollPhysics(),
                                              children: [
                                                Text(
                                                  "Tafsir Ayat ${index + 1}",
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                const SizedBox(height: 20),
                                                SelectableText(
                                                    ayat?.tafsir?.text ??
                                                        'Tidak ada tafsir'),
                                                const SizedBox(height: 10),
                                                Text(
                                                  "Sumber : ${controller.sourceTafsir}",
                                                  style: const TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 12,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  icon: const Icon(Icons.menu_book_rounded),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Get.defaultDialog(
                                      title: "Bookmark",
                                      middleText:
                                          "Apakah anda yakin ingin menambahkan penanda?",
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () async {
                                            // await c.addBookmark(
                                            //   true,
                                            //   surahArgument,
                                            //   ayat!,
                                            //   index,
                                            // );
                                            dashboardC.update();
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: appGreen,
                                          ),
                                          child: const Text("Last Read"),
                                        ),
                                      ],
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.bookmark_add_outlined,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Share.share(
                                        "${ayat?.text?.textUthmani ?? "null"}\n ${ayat?.translation?.text ?? "null"}",
                                        subject: 'sharing');
                                  },
                                  icon: const Icon(Icons.share),
                                ),
                                (ayat?.kondisiAudio == "stop")
                                    ? IconButton(
                                        onPressed: () {
                                          c.playAudio(ayat, index);
                                        },
                                        icon: const Icon(
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
                                                  icon: const Icon(
                                                    Icons.pause,
                                                  ),
                                                )
                                              : IconButton(
                                                  onPressed: () {
                                                    c.resumeAudio(ayat!, index);
                                                  },
                                                  icon: const Icon(
                                                    Icons.play_arrow,
                                                  ),
                                                ),
                                          IconButton(
                                            onPressed: () {
                                              c.stopAudio(ayat!);
                                            },
                                            icon: const Icon(Icons.stop),
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
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      ayat?.text?.textUthmani ?? "null",
                      style: const TextStyle(
                        fontSize: 30,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    ayat?.transliteration ?? "null",
                    style: const TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Html(data: ayat?.translation?.text),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

// Word By Word
  FutureBuilder<List<wordverse.WordVerse>> futureWBW() {
    return FutureBuilder<List<wordverse.WordVerse>>(
      future: controller.getWordVerses(idJuz),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CustomLoading(),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: snapshot.data?.length,
          itemBuilder: (context, index) {
            wordverse.WordVerse? verse = snapshot.data?[index];
            int? lengthGrid = verse?.words?.length;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (verse?.numberInChapter == 1)
                  Container(
                    width: Get.width,
                    margin: const EdgeInsets.only(
                      bottom: 20,
                      top: 20,
                    ),
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
                            '${listSurah[verse!.idChapter! - 1].name}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: appWhite,
                            ),
                          ),
                          Text(
                            '( ${listSurah[verse.idChapter! - 1].translatedName?.translation} )',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: appWhite,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${listSurah[verse.idChapter! - 1].verseCount ?? ''} Ayat | ${listSurah[verse.idChapter! + 1].revelationPlace ?? ''}',
                            style: const TextStyle(
                              fontSize: 16,
                              color: appWhite,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage("assets/images/hexagonal.png"),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "${verse?.numberInChapter}",
                          style: const TextStyle(
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
                        style: const TextStyle(
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
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                Html(data: verse?.translation?.text),
                const SizedBox(
                  height: 10,
                ),
                if (snapshot.hasData)
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 10,
                        crossAxisCount: 3,
                      ),
                      itemBuilder: (_, int indexGrid) {
                        var word = (verse!.words!)[indexGrid];

                        return GestureDetector(
                          onTap: () => controller.playAudioWBW(word.audio!),
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
                                    style: const TextStyle(fontSize: 10),
                                  ),
                                  Text("${word.textUthmani}"),
                                  Text("${word.transliteration}"),
                                  Text(
                                    word.wordTranslations!.text!,
                                    style: const TextStyle(fontSize: 10),
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
        );
      },
    );
  }
}
