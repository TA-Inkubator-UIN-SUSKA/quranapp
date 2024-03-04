import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../constant/api.dart';
import '../../../data/db/bookmark.dart';
import '../../../data/models/juz.dart';
import '../../../data/models/surah.dart';

class HomeController extends GetxController {
  DatabaseManager database = DatabaseManager.instance;
  List<Surah> listSurah = [];

  Future<List<Surah>> getSurahs() async {
    try {
      var res = await http.get(Uri.parse("${baseUrl}chapters?language=id"));
      List data = json.decode(res.body);
      listSurah = data.map((e) => Surah.fromJson(e)).toList();
      return listSurah;
    } catch (e) {
      Get.snackbar("Terjadi Kesalahan", "$e");
      return [];
    }
  }

  Future<List<Juz>> getJuzs() async {
    try {
      var res = await http.get(Uri.parse("${baseUrl}juzs"));
      List data = json.decode(res.body);
      List<Juz> allJuz = data.map((e) => Juz.fromJson(e)).toList();
      return allJuz;
    } catch (e) {
      Get.defaultDialog(
        title: "Terjadi Kesalahan!",
        middleText: "Error : $e",
      );
      return [];
    }
  }
}
