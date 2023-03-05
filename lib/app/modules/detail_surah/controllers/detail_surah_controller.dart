import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quranapp/app/data/models/verse.dart';

class DetailSurahController extends GetxController {
  Future<List<Verse>> getVerse(int idSurah) async {
    var res = await http.get(Uri.parse(
        "https://api.mfikridev.xyz/verses/by_chapter/$idSurah?translation=33&tafsir=1"));
    List data = json.decode(res.body)["verses"];
    List<Verse> allVerse = data.map((e) => Verse.fromJson(e)).toList();
    return allVerse;
  }
}
