import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quran_emufassir/app/constant/api.dart';
import 'package:quran_emufassir/app/data/models/kitab.dart';

class HaditsController extends GetxController {
  List<Map<String, dynamic>> listKitabs = [];
  bool isHaveBab = true;

  Future<List<Map<String, dynamic>>> getKitabs() async {
    try {
      var res = await http.get(Uri.parse(baseUrlHadits));
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

  Future<Kitab?> getKitab(int id) async {
    try {
      var res = await http.get(Uri.parse("$baseUrlHadits$id"));
      var rawData = json.decode(res.body)["data"];
      Kitab data = Kitab.fromJson(rawData);
      data.bab!.isEmpty ? isHaveBab = false : isHaveBab = true;
      return Kitab();
    } catch (e) {
      Get.defaultDialog(
        title: "Terjadi Kesalahan!",
        middleText: "$e",
      );
      return null;
    }
  }

  // Future getHaditsKitab(int id) async {
  //   try {
  //     var res = await http.get(Uri.parse("baseUrlHadits$id"));
  //     var rawData = json.decode(res.body)["data"];

  //   }
  // }
}
