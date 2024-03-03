import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quran_emufassir/app/constant/api.dart';
import 'package:quran_emufassir/app/data/models/kitab.dart';

import '../../../helper/my_dialogs.dart';
import '../../../helper/status.dart';

class HaditsController extends GetxController {
  final textC = TextEditingController();
  List<Map<String, dynamic>> listKitabs = [];
  List<Bab> listBab = [];
  bool isHaveBab = true;
  int jumlahHadits = 0;
  int? idBab;
  late Kitab kitab;
  final int _limit = 5;
  int _page = 1;
  var hasMore = true.obs;
  var listHadits = <Data>[].obs;
  var idSelectedKitab;
  Data hadits = Data();
  final status = Status.none.obs;

  Future<List<Map<String, dynamic>>> getListKitabs() async {
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
      kitab = data;
      listBab = data.bab!;
      return kitab;
    } catch (e) {
      Get.defaultDialog(
        title: "Terjadi Kesalahan!",
        middleText: "$e",
      );
      return null;
    }
  }

  Future<List<Data>?> fetchHaditsBabKitab(int idKitab, int idBab) async {
    try {
      var url =
          "$baseUrlHadits$idKitab/bab/$idBab?pagination=true&limit=$_limit&page=$_page";
      log(url);
      var res = await http.get(Uri.parse(url));
      var rawData = json.decode(res.body)["data"];
      Kitab dataKitab = Kitab.fromJson(rawData);
      List<Data> listHadits = dataKitab.listHadits!.data!;
      return listHadits;
    } catch (e) {
      Get.defaultDialog(
        title: "Terjadi Kesalahan!",
        middleText: "$e",
      );
      return null;
    }
  }

  Future<List<Data>?> fetchHaditsKitab(int idKitab) async {
    try {
      var res = await http.get(Uri.parse(
          "https://hadits.e-mufassir.com/api/hadits/by_id/$idKitab?pagination=true&limit=$_limit&page=$_page"));
      var rawData = json.decode(res.body)["data"];
      Kitab dataKitab = Kitab.fromJson(rawData);
      List<Data> listHadits = dataKitab.listHadits!.data!;
      return listHadits;
    } catch (e) {
      Get.defaultDialog(
        title: "Terjadi Kesalahan!",
        middleText: "$e",
      );
      return null;
    }
  }

  Future<List<Data>?> fetchQueryHadits(int idKitab, String query) async {
    try {
      var res = await http.get(Uri.parse(
          "https://hadits.e-mufassir.com/api/hadits/by_id/$idKitab?pagination=true&limit=$_limit&page=$_page&query=$query"));
      var rawData = json.decode(res.body)["data"];
      Kitab dataKitab = Kitab.fromJson(rawData);
      jumlahHadits = dataKitab.rows!;
      List<Data> listHadits = dataKitab.listHadits!.data!;
      return listHadits;
    } catch (e) {
      Get.defaultDialog(
        title: "Terjadi Kesalahan!",
        middleText: "$e",
      );
      return null;
    }
  }

  Future getMoreHaditsBabKitab(int idKitab, int idBab) async {
    try {
      List<Data>? response = await fetchHaditsBabKitab(idKitab, idBab);
      if (response!.length < _limit) {
        hasMore.value = false;
      }

      listHadits.addAll(response);
      _page++;
    } catch (e) {
      Get.defaultDialog(
        title: "Terjadi Kesalahan!",
        middleText: "$e",
      );
    }
  }

  Future getMoreHaditsKitab(int idKitab) async {
    try {
      List<Data>? response = await fetchHaditsKitab(idKitab);
      if (response!.length < _limit) {
        hasMore.value = false;
      }

      listHadits.addAll(response);
      _page++;
    } catch (e) {
      Get.defaultDialog(
        title: "Terjadi Kesalahan!",
        middleText: "$e",
      );
    }
  }

  Future getMoreQueryHadits(int idKitab, String query) async {
    try {
      List<Data>? response = await fetchQueryHadits(idKitab, query);
      if (response!.length < _limit) {
        hasMore.value = false;
      }

      listHadits.addAll(response);
      _page++;
    } catch (e) {
      Get.defaultDialog(
        title: "Terjadi Kesalahan!",
        middleText: "$e",
      );
    }
  }

  Future refreshData(int idKitab) async {
    _page = 1;
    hasMore.value = true;
    listHadits.value = [];

    await fetchHaditsKitab(idKitab);
  }

  Future refreshDataQuery(int idKitab, String query) async {
    _page = 1;
    hasMore.value = true;
    listHadits.value = [];

    await fetchQueryHadits(idKitab, query);
  }

  Future refreshDataBab(int idKitab, int idBab) async {
    _page = 1;
    hasMore.value = true;
    listHadits.value = [];

    await fetchHaditsBabKitab(idKitab, idBab);
  }

  Future clearData() async {
    _page = 1;
    hasMore.value = true;
    listHadits.value = [];
  }

  Future<void> searchHadits() async {
    try {
      if (idSelectedKitab == null) {
        MyDialog.info("Pilih Kitab!");
      }
      if (textC.text.trim().isNotEmpty) {
        status.value = Status.loading;

        var res = await http.get(Uri.parse(
            "https://hadits.e-mufassir.com/api/hadits/by_id/$idSelectedKitab/${textC.text}"));
        var rawData = json.decode(res.body)["data"];
        print(rawData.toString());
        hadits = Data.fromJson(rawData);

        status.value = Status.complete;
      } else {
        MyDialog.info("Masukkan nomor hadits!");
      }
    } catch (e) {
      Get.defaultDialog(
        title: "Terjadi Kesalahan!",
        middleText: "$e",
      );
    }
  }

  // Future getHaditsKitab(int id) async {
  //   try {
  //     var res = await http.get(Uri.parse("baseUrlHadits$id"));
  //     var rawData = json.decode(res.body)["data"];

  //   }
  // }
}
