import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quranapp/app/constant/api.dart';
import 'package:quranapp/app/data/db/bookmark.dart';
import 'package:quranapp/app/data/models/juz.dart';
import 'package:quranapp/app/data/models/surah.dart';
import 'package:sqflite/sqflite.dart';

class HomeController extends GetxController {
  DatabaseManager database = DatabaseManager.instance;

  Future<Map<String, dynamic>?> getLastRead() async {
    Database db = await database.db;
    List<Map<String, dynamic>> dataLastRead = await db.query(
      "bookmark",
    );
    if (dataLastRead.length == 0) {
      return null;
    } else {}
    return dataLastRead.first;
  }

  Future<List<Surah>> getSurahs() async {
    var res = await http.get(Uri.parse("${APIENDPOINT}chapters?language=id"));
    List data = json.decode(res.body);

    List<Surah> allSurah = data.map((e) => Surah.fromJson(e)).toList();
    return allSurah;
  }

  Future<List<Juz>> getJuzs() async {
    var res = await http.get(Uri.parse("${APIENDPOINT}juzs"));
    List data = json.decode(res.body);

    List<Juz> allJuz = data.map((e) => Juz.fromJson(e)).toList();
    return allJuz;
  }
}
