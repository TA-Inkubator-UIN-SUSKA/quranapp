import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quranapp/app/data/models/word_chapter.dart';

void main() async {
  var res = await http.get(Uri.parse(
      "https://api.qurancdn.com/api/qdc/verses/by_chapter/1?words=true&per_page=all&fields=text_uthmani&word_translation_language=id"));
  print(json.decode(res.body)["verses"]);
  // List<Map<String, dynamic>> rawlistVerse = json.decode(res.body)["verses"];
  // List<WordChapter> listVerse =
  //     rawlistVerse.map((e) => WordChapter.fromJson(e)).toList();

  // print(listVerse[0]);
}
