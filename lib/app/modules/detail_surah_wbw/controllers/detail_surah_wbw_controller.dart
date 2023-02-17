import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quranapp/app/data/models/word_chapter.dart';

class DetailSurahWbwController extends GetxController {
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
