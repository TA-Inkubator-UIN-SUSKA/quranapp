import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quran_emufassir/app/helper/data_tafsirs.dart';
import '../../../constant/api.dart';
import '../../../data/models/reciter.dart';
import 'package:http/http.dart' as http;
import '../../../data/models/tafsir.dart' as tafsir;

class SettingsController extends GetxController {
  final switchWBWController = GetStorage();
  final selectedIDController = GetStorage();
  var isWBW = false;
  var idSelectedReciter = 7;
  List<Reciter> allReciters = [];
  var idSelectedTafsir = 1;
  var indexSelectedTafsir = 0;
  var indexSelectedStyle = 0;
  List<tafsir.Tafsir> allTafsirs = listTafsir;

  List allStyle = [
    "Uthmani",
    "Uthmani Simple",
    "Imlaei",
    "Imlaei Simple",
    "Indopak"
  ];

  SettingsController({bool fromDashboard = false}) {
    if (!fromDashboard && switchWBWController.read("switchWBW") != null) {
      if (fromDashboard) {
        switchWBWController.write("switchWBW", false);
      } else {
        isWBW = switchWBWController.read("switchWBW");
      }
      update();
    }
    if (selectedIDController.read("idReciter") != null) {
      idSelectedReciter = selectedIDController.read("idReciter");
      update();
    }
    if (selectedIDController.read("idTafsir") != null &&
        selectedIDController.read("indexTafsir") != null) {
      idSelectedTafsir = selectedIDController.read("idTafsir");
      indexSelectedTafsir = selectedIDController.read("indexTafsir");
      update();
    }
    if (selectedIDController.read("indexStyle") != null) {
      indexSelectedStyle = selectedIDController.read("indexStyle");
      update();
    }
  }

  changeSwitchWBW(bool value) {
    isWBW = value;
    switchWBWController.write("switchWBW", isWBW);
    update();
  }

  selectIDReciter(int id) {
    idSelectedReciter = id;
    selectedIDController.write("idReciter", id);
    update();
  }

  Future<List<Reciter>> getReciter() async {
    var res = await http.get(Uri.parse("${baseUrl}recitations"));
    List data = json.decode(res.body);

    List<Reciter> listReciter = data.map((e) => Reciter.fromJson(e)).toList();
    allReciters = listReciter;
    return listReciter;
  }

  selectIDTafsir(int id) {
    idSelectedTafsir = id;
    selectedIDController.write("idTafsir", id);
    update();
  }

  selectStyle(int style) {
    indexSelectedStyle = style;
    selectedIDController.write("indexStyle", style);
    update();
  }

  // Future<List<tafsir.Tafsir>> getTafsirs() async {
  //   var res = await http.get(Uri.parse("${baseUrl}tafsirs"));
  //   List data = json.decode(res.body);

  //   List<tafsir.Tafsir> listTafsir =
  //       data.map((e) => tafsir.Tafsir.fromJson(e)).toList();
  //   allTafsirs = listTafsir;
  //   log(data.toString());
  //   return listTafsir;
  // }
}
