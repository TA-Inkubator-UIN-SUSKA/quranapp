import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HaditsController extends GetxController {
  List<Map<String, dynamic>> listKitabs = [];

  Future<List<Map<String, dynamic>>> getKitabs() async {
    try {
      var res =
          await http.get(Uri.parse("https://hadits.e-mufassir.com/api/hadits"));
      List<dynamic> rawData = json.decode(res.body)["data"];
      List<Map<String, dynamic>> listData = List<Map<String, dynamic>>.from(
          rawData.map((e) => Map<String, dynamic>.from(e)));
      listKitabs = listData;
      return listData;
    } catch (e) {
      Get.snackbar("Terjadi Kesalahan", "$e");
      return [];
    }
  }
}
