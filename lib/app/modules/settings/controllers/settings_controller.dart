import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quranapp/app/constant/api.dart';
import 'package:quranapp/app/data/models/reciter.dart';
import 'package:http/http.dart' as http;

class SettingsController extends GetxController {
  final switchWBWController = GetStorage();
  final selectedIDReciterController = GetStorage();
  var isWBW = false;
  var idSelectedReciter = 6;
  List<Reciter> allReciters = [];

  SettingsController() {
    if (switchWBWController.read("switchWBW") != null) {
      isWBW = switchWBWController.read("switchWBW");
      update();
      print("isWBW : ${isWBW}");
    }
    if (selectedIDReciterController.read("idReciter") != null) {
      idSelectedReciter = selectedIDReciterController.read("idReciter");
      update();
      print("idSelectedReciter : ${idSelectedReciter}");
    }
  }

  changeSwitchWBW(bool value) {
    isWBW = value;
    switchWBWController.write("switchWBW", isWBW);
    update();
    print("isWBW : ${isWBW}");
  }

  selectIDReciter(int id) {
    idSelectedReciter = id;
    selectedIDReciterController.write("idReciter", id);
    update();
    print(id);
  }

  Future<List<Reciter>> getReciter() async {
    var res = await http.get(Uri.parse("${APIENDPOINT}recitations"));
    List data = json.decode(res.body);

    List<Reciter> listReciter = data.map((e) => Reciter.fromJson(e)).toList();
    allReciters = listReciter;
    return listReciter;
  }

  Future getTafsirs() async {
    var res = await http.get(Uri.parse("${APIENDPOINT}tafsirs"));
    List data = json.decode(res.body);
    print(data);
    


  }
}
