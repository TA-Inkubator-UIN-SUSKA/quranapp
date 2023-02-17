import 'package:get/get.dart';

import '../controllers/detail_surah_wbw_controller.dart';

class DetailSurahWbwBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailSurahWbwController>(
      () => DetailSurahWbwController(),
    );
  }
}
