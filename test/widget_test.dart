import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quranapp/app/constant/api.dart';
import 'package:quranapp/app/data/models/surah.dart';

import 'package:quranapp/app/data/models/word_chapter.dart';
import 'package:quranapp/app/data/models/word_verse.dart';

void main() async {
  var url =
      "${APIENDPOINT}words/by_chapter/1?translation=17&tafsir=1&recitation=7&words=true";
  var res = await http.get(Uri.parse(url));
  List rawlistVerse = json.decode(res.body)["verses"];
}
