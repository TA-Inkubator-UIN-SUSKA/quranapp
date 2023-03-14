import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends GetxController {
  final switchWBWController = GetStorage();
  var isWBW = false;

  SettingsController() {
    if (switchWBWController.read("switchWBW") != null) {
      isWBW = switchWBWController.read("switchWBW");
      update();
      print("isWBW : ${isWBW}");
    }
  }

  changeSwitchWBW(bool value) {
    isWBW = value;
    switchWBWController.write("switchWBW", isWBW);
    update();
    print("isWBW : ${isWBW}");
  }
}
