import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:quran_emufassir/app/data/models/bookmark.dart';
import 'package:quran_emufassir/app/data/models/hijriah_date.dart';
import 'package:quran_emufassir/app/data/models/surah.dart';
import 'package:quran_emufassir/app/helper/my_dialogs.dart';
import 'package:sqflite/sqflite.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

import '../../../data/db/bookmark.dart';

class DashboardController extends GetxController {
  DatabaseManager database = DatabaseManager.instance;

  Future<void> launchDonationURL() async {
    String url = 'https://quran.e-mufassir.com/donation';

    if (!await launchUrl(
      Uri.parse(url),
    )) {
      MyDialog.info("Gagal membuka halaman donasi");
    }
  }

  Future<HijriahDate?> getHijriahDate() async {
    try {
      var now = DateTime.now();
      String dateNow = "${now.year}-${now.month}-${now.day}";
      var res = await http.get(
        Uri.parse("https://masehi-ke-hijriyah.p.rapidapi.com?tanggal=$dateNow"),
        headers: {
          'X-RapidAPI-Key':
              'fe9d2f561bmshc61222cc1e90908p1b4ed3jsn1593cec972a4',
        },
      );
      HijriahDate data = HijriahDate.fromJson((jsonDecode(res.body))[0]);
      return data;
    } catch (e) {
      Get.defaultDialog(
        title: "Terjadi Kesalahan!",
        middleText: "Gagal mendapatkan data!",
      );
      return null;
    }
  }

  Future<Bookmark?> getLastRead() async {
    log("getLastRead");
    Database db = await database.db;
    List<Map<String, dynamic>> dataLastRead = await db.query(
      "bookmark",
      where: "last_read = 1",
    );
    if (dataLastRead.isEmpty) {
      return null;
    }
    print("${(dataLastRead)}");
    Bookmark lastRead = Bookmark.fromJson(dataLastRead.first);
    print("${(lastRead.surah)}");
    // Surah surah = Surah.fromJson(jsonDecode(lastRead.surah!));
    // print("test : ${surah.toString()}");
    return lastRead;
  }
}
