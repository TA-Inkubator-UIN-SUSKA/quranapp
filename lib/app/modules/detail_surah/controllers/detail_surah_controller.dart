import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quranapp/app/data/models/verse.dart';
import 'package:quranapp/app/data/models/word_chapter.dart';

class DetailSurahController extends GetxController {
  Future<List<Verse>> getTextVerse(int id) async {
    var url =
        "https://api.quran.com/api/v4/quran/verses/uthmani?chapter_number=$id";
    var res = await http.get(Uri.parse(url));
    List rawlistVerse = json.decode(res.body)["verses"];
    List<Verse> listVerse = rawlistVerse.map((e) => Verse.fromJson(e)).toList();

    return listVerse;
  }
  Future<List<Verse>> getTranslationVerse(int id) async {
    var url =
        "https://api.quran.com/api/v4/quran/translations/33?chapter_number=$id";
    var res = await http.get(Uri.parse(url));
    List rawlistVerse = json.decode(res.body)["translations"];
    List<Verse> listVerse = rawlistVerse.map((e) => Verse.fromJson(e)).toList();

    return listVerse;
  }
}
