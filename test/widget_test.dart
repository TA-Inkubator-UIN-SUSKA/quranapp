import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quranapp/app/data/models/verse.dart';
import 'package:quranapp/app/data/models/word_chapter.dart';

void main() async {
  var url =
      "https://api.quran.com/api/v4/quran/translations/33?chapter_number=1";
  var res = await http.get(Uri.parse(url));
  List rawlistVerse = json.decode(res.body)["translations"];
  List<Verse> listVerse = rawlistVerse.map((e) => Verse.fromJson(e)).toList();

  print(listVerse[0].text);
}
