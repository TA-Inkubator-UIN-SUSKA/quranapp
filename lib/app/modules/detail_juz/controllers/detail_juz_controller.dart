import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:just_audio/just_audio.dart';
import 'package:http/http.dart' as http;
import 'package:quranapp/app/constant/api.dart';
import 'package:quranapp/app/data/models/surah.dart';
import 'package:quranapp/app/data/models/verse.dart' as verse;
import 'package:quranapp/app/data/models/word_chapter.dart';
import 'package:quranapp/app/data/models/word_verse.dart';

class DetailJuzController extends GetxController {
  final getStorageController = GetStorage();
  final player = AudioPlayer();
  var isWBW = false;
  List<Surah> allSurah = [];

  DetailJuzController() {
    if (getStorageController.read("switchWBW") != null) {
      isWBW = getStorageController.read("switchWBW");
      update();
      print("isWBW : ${isWBW}");
    }
  }

  Future<List<verse.Verse>> getVerse(
      {required int idJuz, int idReciter = 6, int idTafsir = 1}) async {
    var res = await http.get(Uri.parse(
        "${APIENDPOINT}verses/by_juz/$idJuz?translation=33&tafsir=$idTafsir&recitation=$idReciter"));
    List data = json.decode(res.body)["verses"];
    List<verse.Verse> allVerse =
        data.map((e) => verse.Verse.fromJson(e)).toList();
    return allVerse;
  }

  Future<List<Surah>> getSurahs() async {
    var res = await http.get(Uri.parse("${APIENDPOINT}chapters?language=id"));
    List data = json.decode(res.body);

    List<Surah> allSurah = data.map((e) => Surah.fromJson(e)).toList();
    return allSurah;
  }

  Future<List<WordVerse>> getWordVerses(int id) async {
    var url =
        "${APIENDPOINT}verses/by_juz/$id?translation=33&tafsir=1&recitation=7&words=true";
    var res = await http.get(Uri.parse(url));
    List rawlistVerse = json.decode(res.body)["verses"];
    List<WordVerse> listVerse =
        rawlistVerse.map((e) => WordVerse.fromJson(e)).toList();

    return listVerse;
  }

  // Future<List<WordChapter>> getWordVerses(int id) async {
  //   var url =
  //       "$APIENDPOINT/words/by_chapter/1?language=13";
  //   var res = await http.get(Uri.parse(url));
  //   List rawlistVerse = json.decode(res.body)["words"];
  //   List<WordChapter> listVerse =
  //       rawlistVerse.map((e) => WordChapter.fromJson(e)).toList();

  //   // print(listVerse[0]["words"]);
  //   print(listVerse);
  //   return listVerse;
  // }

  void playAudio(verse.Verse ayat) async {
    if (ayat.audio?.url != null) {
      try {
        update();
        String url = ayat.audio!.url!;
        if (ayat.audio!.url!.contains("https") == false) {
          url = "https:${ayat.audio!.url!}";
        }
        await player.stop();
        await player.setUrl(url);
        ayat.kondisiAudio = "playing";
        update();
        await player.play();
        ayat.kondisiAudio = "stop";
        update();
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

  void pauseAudio(verse.Verse ayat) async {
    try {
      await player.pause();

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

  void resumeAudio(verse.Verse ayat) async {
    try {
      update();
      await player.play();
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

  void stopAudio(verse.Verse ayat) async {
    try {
      await player.stop();
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
    if (url != null) {
      try {
        await player.stop();
        await player.setUrl("https://verses.quran.com/$url");

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
