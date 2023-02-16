import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quranapp/app/data/models/surah.dart';

class HomeController extends GetxController {
  Future<List<Surah>> getResource() async {
    var res = await http
        .get(Uri.parse("https://api.quran.com/api/v4/chapters?language=id"));
    List data = json.decode(res.body)["chapters"];

    List<Surah> allSurah = data.map((e) => Surah.fromJson(e)).toList();
    return allSurah;
  }
}
