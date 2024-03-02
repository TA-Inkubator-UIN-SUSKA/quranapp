import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:quran_emufassir/app/helper/data_tafsirs.dart';
import 'package:quran_emufassir/app/helper/my_dialogs.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import '../../../constant/api.dart';
import '../../../data/db/bookmark.dart';
import '../../../data/models/surah.dart';
import '../../../data/models/tafsir.dart' as tafsir;
import '../../../data/models/verse.dart';
import 'package:just_audio/just_audio.dart';
import '../../../data/models/word_verse.dart';
import 'package:sqflite/sqflite.dart';

class DetailSurahController extends GetxController {
  AutoScrollController scrollC = AutoScrollController();
  final getStorageController = GetStorage();
  final player = AudioPlayer();
  Verse? lastVerse;
  DatabaseManager database = DatabaseManager.instance;
  String? sourceTafsir;
  late List<Verse> listVerses;
  bool stopRequestedAudio = false;
  bool isPauseAudio = false;


  Future addBookmark(
    bool lastRead,
    Surah surah,
    Verse ayat,
    int indexAyat,
  ) async {
    Database db = await database.db;

    bool flagExist = false;

    await db.delete("bookmark");

    List checkData = await db.query("bookmark",
        where:
            "surah = '${surah.name!.replaceAll("'", "+")}' and number_surah = ${surah.numberChapter!} and ayat = ${ayat.numberInChapter} and juz = ${ayat.idJuz} and via = 'surah' and index_ayat = $indexAyat");
    if (checkData.isNotEmpty) {
      flagExist = true;
    }

    if (flagExist == false) {
      await db.insert("bookmark", {
        "surah": surahToJson(surah),
        "number_surah": surah.numberChapter!,
        "ayat": ayat.numberInChapter!,
        "juz": ayat.idJuz,
        "via": "surah",
        "index_ayat": indexAyat,
        "last_read": lastRead == true ? 1 : 0,
      });

      Get.back();
      Get.snackbar(
        "Berhasil",
        "Berhasil menambahkan Bookmark!",
        colorText: Colors.black,
      );
    } else {
      Get.back();
      Get.snackbar(
        "Terjadi Kesalahan",
        "Bookmark telah tersedia",
        colorText: Colors.black,
      );
    }
  }

  Future<List<Verse>> getVerse(
      {required int idSurah, int idReciter = 7, int idTafsir = 1}) async {
    sourceTafsir = getSourceTafsir(idTafsir);
    log("${baseUrl}verses/by_chapter/$idSurah?translation=33&tafsir=$idTafsir&recitation=$idReciter");

    var res = await http.get(Uri.parse(
        "${baseUrl}verses/by_chapter/$idSurah?translation=33&tafsir=$idTafsir&recitation=$idReciter"));
    List data = json.decode(res.body)["verses"];
    List<Verse> allVerse = data.map((e) => Verse.fromJson(e)).toList();
    listVerses = allVerse;
    return allVerse;
  }

  String? getSourceTafsir(int idTafsir) {
    tafsir.Tafsir sourceTafsir =
        listTafsir.firstWhere((element) => element.id == idTafsir);
    return sourceTafsir.name;
  }

  Future<List<WordVerse>> getWordVerses(int id) async {
    var url =
        "${baseUrl}verses/by_chapter/$id?translation=33&tafsir=1&recitation=7&words=true";
    var res = await http.get(Uri.parse(url));
    List rawlistVerse = json.decode(res.body)["verses"];
    List<WordVerse> listVerse =
        rawlistVerse.map((e) => WordVerse.fromJson(e)).toList();
    return listVerse;
  }

  void playAudio(Verse? ayat, int index) async {
    if (ayat?.audio?.url != null) {
      try {
        if (isPauseAudio) {
          return;
        }
        MyDialog.showLoadingDialog();
        stopRequestedAudio = false;

        // Fix Kebocoran Audio
        lastVerse ??= ayat;
        lastVerse!.kondisiAudio = "stop";
        lastVerse = ayat;
        lastVerse!.kondisiAudio = "stop";

        update();
        log(ayat!.kondisiAudio);

        // Url Formatter
        String url = ayat.audio!.url!;
        if (ayat.audio!.url!.contains("https") == false) {
          url = "https:${ayat.audio!.url!}";
        }
        await player.stop();
        await player.setUrl(url);
        ayat.kondisiAudio = "playing";
        update();
        log(ayat.kondisiAudio);
        Get.back();

        // Playing
        await player.play();
        ayat.kondisiAudio = "stop";
        update();
        log(ayat.kondisiAudio);
        await player.stop();

        if (!stopRequestedAudio &&
            !isPauseAudio &&
            index < listVerses.length - 1) {
          scrollC.scrollToIndex(index + 2,
              preferPosition: AutoScrollPosition.begin);
          playAudio(listVerses[index + 1], index + 1);
        }
      } on PlayerException catch (e) {
        Get.defaultDialog(
          title: "Terjadi Kesalahan!",
          middleText: "Error code: ${e.code} - Error message: ${e.message}",
        );
      } on PlayerInterruptedException catch (e) {
        Get.defaultDialog(
          title: "Terjadi Kesalahan!",
          middleText: "Connection aborted: ${e.message}",
        );
      } catch (e) {
        Get.defaultDialog(
          title: "Terjadi Kesalahan!",
          middleText: "An error occured: $e",
        );
      }
    } else {
      Get.defaultDialog(
        title: "Terjadi Kesalahan!",
        middleText: "URL Audio tidak valid!",
      );
    }
  }

  void pauseAudio(Verse ayat) async {
    try {
      await player.pause();
      ayat.kondisiAudio = "pause";
      isPauseAudio = true;
      update();
    } on PlayerException catch (e) {
      Get.defaultDialog(
        title: "Terjadi Kesalahan!",
        middleText: "Error code: ${e.code} - Error message: ${e.message}",
      );
    } on PlayerInterruptedException catch (e) {
      Get.defaultDialog(
        title: "Terjadi Kesalahan!",
        middleText: "Connection aborted: ${e.message}",
      );
    } catch (e) {
      Get.defaultDialog(
        title: "Terjadi Kesalahan!",
        middleText: "An error occured: $e",
      );
    }
  }

  void resumeAudio(Verse ayat, int index) async {
    try {
      ayat.kondisiAudio = "playing";
      isPauseAudio = false;
      update();
      await player.play();
      ayat.kondisiAudio = "stop";
      update();
      if (!stopRequestedAudio &&
          !isPauseAudio &&
          index < listVerses.length - 1) {
        scrollC.scrollToIndex(index + 2,
            preferPosition: AutoScrollPosition.begin);
        playAudio(listVerses[index + 1], index + 1);
      }
    } on PlayerException catch (e) {
      Get.defaultDialog(
        title: "Terjadi Kesalahan!",
        middleText: "Error code: ${e.code} - Error message: ${e.message}",
      );
    } on PlayerInterruptedException catch (e) {
      Get.defaultDialog(
        title: "Terjadi Kesalahan!",
        middleText: "Connection aborted: ${e.message}",
      );
    } catch (e) {
      Get.defaultDialog(
        title: "Terjadi Kesalahan!",
        middleText: "An error occured: $e",
      );
    }
  }

  void stopAudio(Verse ayat) async {
    try {
      stopRequestedAudio = true;
      await player.stop();
      ayat.kondisiAudio = "stop";
      update();
    } on PlayerException catch (e) {
      Get.defaultDialog(
        title: "Terjadi Kesalahan!",
        middleText: "Error code: ${e.code} - Error message: ${e.message}",
      );
    } on PlayerInterruptedException catch (e) {
      Get.defaultDialog(
        title: "Terjadi Kesalahan!",
        middleText: "Connection aborted: ${e.message}",
      );
    } catch (e) {
      Get.defaultDialog(
        title: "Terjadi Kesalahan!",
        middleText: "An error occured: $e",
      );
    }
  }

  void playAudioWBW(String url) async {
    if (url.isNotEmpty) {
      try {
        MyDialog.showLoadingDialog();
        await player.stop();
        await player.setUrl(url);

        Get.back();
        await player.play();

        await player.stop();
      } on PlayerException catch (e) {
        Get.defaultDialog(
          title: "Terjadi Kesalahan!",
          middleText: "Error code: ${e.code} - Error message: ${e.message}",
        );
      } on PlayerInterruptedException catch (e) {
        Get.defaultDialog(
          title: "Terjadi Kesalahan!",
          middleText: "Connection aborted: ${e.message}",
        );
      } catch (e) {
        Get.defaultDialog(
          title: "Terjadi Kesalahan!",
          middleText: "An error occured: $e",
        );
      }
    } else {
      Get.defaultDialog(
        title: "Terjadi Kesalahan!",
        middleText: "URL Audio tidak valid!",
      );
    }
  }

  @override
  void onClose() {
    player.stop();
    player.dispose();
    super.onClose();
  }
}
