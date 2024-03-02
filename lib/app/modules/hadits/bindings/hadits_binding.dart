import 'package:get/get.dart';

import '../controllers/hadits_controller.dart';

class HaditsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HaditsController>(
      () => HaditsController(),
    );
  }
}
