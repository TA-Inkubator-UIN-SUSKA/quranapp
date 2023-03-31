import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quranapp/app/constant/api.dart';
import 'package:quranapp/app/data/models/surah.dart';

import 'package:quranapp/app/data/models/word_chapter.dart';

void main() async {
  List<Surah> allSurah = [];
  var url = "${APIENDPOINT}chapters";
  var res = await http.get(Uri.parse(url));
  List data = json.decode(res.body);
  data.map((e) {
    allSurah.add(Surah.fromJson(e));
  });
  print(allSurah);
}
