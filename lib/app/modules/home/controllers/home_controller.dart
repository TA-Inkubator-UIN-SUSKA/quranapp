import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../constant/api.dart';
import '../../../data/db/bookmark.dart';
import '../../../data/models/juz.dart';
import '../../../data/models/surah.dart';
import 'package:sqflite/sqflite.dart';

class HomeController extends GetxController {
  DatabaseManager database = DatabaseManager.instance;
  List<Surah> listSurah = [];

  Future<Map<String, dynamic>?> getLastRead() async {
    Database db = await database.db;
    List<Map<String, dynamic>> dataLastRead = await db.query(
      "bookmark",
    );
    if (dataLastRead.isEmpty) {
      return null;
    }
    log(dataLastRead.toString());
    return dataLastRead.first;
  }

  Future<List<Surah>> getSurahs() async {
    try {
      var res = await http.get(Uri.parse("${baseUrl}chapters?language=id"));
      List data = json.decode(res.body);
      // log(data.toString());

      listSurah = data.map((e) => Surah.fromJson(e)).toList();

      return listSurah;
    } catch (e) {
      Get.snackbar("Terjadi Kesalahan", "$e");
      log(e.toString());
      return [];
    }
  }

  Future<List<Juz>> getJuzs() async {
    var res = await http.get(Uri.parse("${baseUrl}juzs"));
    List data = json.decode(res.body);

    List<Juz> allJuz = data.map((e) => Juz.fromJson(e)).toList();
    return allJuz;
  }
}
