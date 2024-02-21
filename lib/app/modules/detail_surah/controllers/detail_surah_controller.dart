import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:quran_emufassir/app/helper/data_tafsirs.dart';
import 'package:quran_emufassir/app/helper/my_dialogs.dart';
import '../../../constant/api.dart';
import '../../../data/db/bookmark.dart';
import '../../../data/models/surah.dart';
import '../../../data/models/tafsir.dart' as tafsir;
import '../../../data/models/verse.dart';
import 'package:just_audio/just_audio.dart';
import '../../../data/models/word_verse.dart';
import 'package:sqflite/sqflite.dart';

class DetailSurahController extends GetxController {
  final getStorageController = GetStorage();
  final player = AudioPlayer();
  var isWBW = false;
  Verse? lastVerse;
  DatabaseManager database = DatabaseManager.instance;
  String? sourceTafsir;

  DetailSurahController() {
    if (getStorageController.read("switchWBW") != null) {
      isWBW = getStorageController.read("switchWBW");
      update();
    }
  }

  Future addBookmark(
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
        "surah": surah.name!.replaceAll("'", "+"),
        "number_surah": surah.numberChapter!,
        "ayat": ayat.numberInChapter!,
        "juz": ayat.idJuz,
        "via": "surah",
        "index_ayat": indexAyat,
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

    // var data = await db.query("bookmark");
  }

  Future<List<Verse>> getVerse(
      {required int idSurah, int idReciter = 6, int idTafsir = 1}) async {
    sourceTafsir = getSourceTafsir(idTafsir);
    log("getVerse");
    var res = await http.get(Uri.parse(
        "${baseUrl}verses/by_chapter/$idSurah?translation=33&tafsir=$idTafsir&recitation=$idReciter"));
    List data = json.decode(res.body)["verses"];
    List<Verse> allVerse = data.map((e) => Verse.fromJson(e)).toList();

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

  void playAudio(Verse? ayat) async {
    if (ayat?.audio?.url != null) {
      try {
        MyDialog.showLoadingDialog();

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

  void resumeAudio(Verse ayat) async {
    try {
      ayat.kondisiAudio = "playing";
      update();
      await player.play();
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

  void stopAudio(Verse ayat) async {
    try {
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
