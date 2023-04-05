import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:quranapp/app/constant/api.dart';
import 'package:quranapp/app/data/models/verse.dart';
import 'package:quranapp/app/data/models/word_chapter.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quranapp/app/data/models/word_verse.dart';

class DetailSurahController extends GetxController {
  final getStorageController = GetStorage();
  final player = AudioPlayer();
  var isWBW = false;
  Verse? lastVerse;

  DetailSurahController() {
    if (getStorageController.read("switchWBW") != null) {
      isWBW = getStorageController.read("switchWBW");
      update();
      print("isWBW : ${isWBW}");
    }
  }

  Future<List<Verse>> getVerse(
      {required int idSurah, int idReciter = 6, int idTafsir = 1}) async {
    var res = await http.get(Uri.parse(
        "${APIENDPOINT}verses/by_chapter/$idSurah?translation=33&tafsir=$idTafsir&recitation=$idReciter"));
    List data = json.decode(res.body)["verses"];
    List<Verse> allVerse = data.map((e) => Verse.fromJson(e)).toList();
    return allVerse;
  }

  // Future<List<WordChapter>> getWordVerses(int id) async {
  //   var url =
  //       "https://api.qurancdn.com/api/qdc/verses/by_chapter/$id?words=true&per_page=all&fields=text_uthmani&word_translation_language=id";
  //   var res = await http.get(Uri.parse(url));
  //   List rawlistVerse = json.decode(res.body)["verses"];
  //   List<WordChapter> listVerse =
  //       rawlistVerse.map((e) => WordChapter.fromJson(e)).toList();

  //   // print(listVerse[0]["words"]);
  //   print(listVerse);
  //   return listVerse;
  // }

  Future<List<WordVerse>> getWordVerses(int id) async {
    var url =
        "${APIENDPOINT}verses/by_chapter/$id?translation=33&tafsir=1&recitation=7&words=true";
    var res = await http.get(Uri.parse(url));
    List rawlistVerse = json.decode(res.body)["verses"];
    List<WordVerse> listVerse =
        rawlistVerse.map((e) => WordVerse.fromJson(e)).toList();

    return listVerse;
  }

  void playAudio(Verse? ayat) async {
    if (ayat?.audio?.url != null) {
      try {
        if (lastVerse == null) {
          lastVerse = ayat;
        }

        lastVerse!.kondisiAudio = "stop";
        lastVerse = ayat;
        lastVerse!.kondisiAudio = "stop";
        update();
        String url = ayat!.audio!.url!;
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
    if (url != null) {
      try {
        await player.stop();
        await player.setUrl(url);

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
