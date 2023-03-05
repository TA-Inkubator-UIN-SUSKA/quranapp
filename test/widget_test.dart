import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quranapp/app/data/models/surah.dart';
import 'package:quranapp/app/data/models/verse.dart';
import 'package:quranapp/app/data/models/word_chapter.dart';

void main() async {
  var res = await http
        .get(Uri.parse("https://api.mfikridev.xyz/chapters?language=id"));
    List data = json.decode(res.body);

    List<Surah> allSurah = data.map((e) => Surah.fromJson(e)).toList();

  print(allSurah[0].name);
}
