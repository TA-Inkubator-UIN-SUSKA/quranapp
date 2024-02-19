import 'dart:convert';

import 'package:get/get.dart';
import 'package:quran_emufassir/app/helper/my_dialogs.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class DashboardController extends GetxController {
  Future<void> launchDonationURL() async {
    String url = 'https://quran.e-mufassir.com/donation';

    if (!await launchUrl(
      Uri.parse(url),
    )) {
      MyDialog.info("Gagal membuka halaman donasi");
    }
  }

  Future<Map<String, dynamic>?> getHijriahDate() async {
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
      var data = (jsonDecode(res.body))[0];
      return data;
    } catch (e) {
      return {};
    }
  }
}
