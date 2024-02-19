import 'package:get/get.dart';
import 'package:quran_emufassir/app/helper/my_dialogs.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardController extends GetxController {
  Future<void> launchDonationURL() async {
    String url = 'https://quran.e-mufassir.com/donation';

    if (!await launchUrl(
      Uri.parse(url),
    )) {
      MyDialog.info("Gagal membuka halaman donasi");
    }
  }
}
