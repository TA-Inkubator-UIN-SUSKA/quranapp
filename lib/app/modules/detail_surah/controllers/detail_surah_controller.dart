import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:quranapp/app/data/models/verse.dart';
import 'package:quranapp/app/data/models/word_chapter.dart';

class DetailSurahController extends GetxController {

final switchWBWController = GetStorage();
  var isWBW = false;

  DetailSurahController() {
    if (switchWBWController.read("switchWBW") != null) {
      isWBW = switchWBWController.read("switchWBW");
      update();
      print("isWBW : ${isWBW}");
    }
  }

  Future<List<Verse>> getVerse(int idSurah) async {
    var res = await http.get(Uri.parse(
        "https://api.mfikridev.xyz/verses/by_chapter/$idSurah?translation=33&tafsir=1&recitation=7"));
    List data = json.decode(res.body)["verses"];
    List<Verse> allVerse = data.map((e) => Verse.fromJson(e)).toList();
    return allVerse;
  }

  Future<List<WordChapter>> getWordVerses(int id) async {
    var url =
        "https://api.qurancdn.com/api/qdc/verses/by_chapter/$id?words=true&per_page=all&fields=text_uthmani&word_translation_language=id";
    var res = await http.get(Uri.parse(url));
    List rawlistVerse = json.decode(res.body)["verses"];
    List<WordChapter> listVerse =
        rawlistVerse.map((e) => WordChapter.fromJson(e)).toList();

    // print(listVerse[0]["words"]);
    print(listVerse);
    return listVerse;
  }
}
