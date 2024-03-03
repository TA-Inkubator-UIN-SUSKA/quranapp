import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/theme.dart';
import '../controllers/hadits_controller.dart';

class HaditsView extends GetView<HaditsController> {
  const HaditsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: appGreenDark),
        title: Text(
          'Musnad Ahmad',
          style: const TextStyle(
            color: appGreenDark,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
        children: [
          Container(
            width: mq.width,
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: appGreen,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Text(
              "Musnad Ahmad #1",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: appGreenLight),
            child: Text(
              " حَدَّثَنَا قُتَيْبَةُ بْنُ سَعِيدٍ حَدَّثَنَا أَبُو عَوَانَةَ عَنْ سِمَاكِ بْنِ حَرْبٍ ح و حَدَّثَنَا هَنَّادٌ حَدَّثَنَا وَكِيعٌ عَنْ إِسْرَائِيلَ عَنْ سِمَاكٍ عَنْ مُصْعَبِ بْنِ سَعْدٍ عَنْ ابْنِ عُمَرَ عَنْ النَّبِيِّ صَلَّى اللَّهُ عَلَيْهِ وَسَلَّمَ قَالَ لَا تُقْبَلُ صَلَاةٌ بِغَيْرِ طُهُورٍ وَلَا صَدَقَةٌ مِنْ غُلُولٍ قَالَ هَنَّادٌ فِي حَدِيثِهِ إِلَّا بِطُهُورٍ قَالَ أَبُو عِيسَى هَذَا الْحَدِيثُ أَصَحُّ شَيْءٍ فِي هَذَا الْبَابِ وَأَحْسَنُ وَفِي الْبَاب عَنْ أَبِي الْمَلِيحِ عَنْ أَبِيهِ وَأَبِي هُرَيْرَةَ وَأَنَسٍ وَأَبُو الْمَلِيحِ بْنُ أُسَامَةَ اسْمُهُ عَامِرٌ وَيُقَالُ زَيْدُ بْنُ أُسَامَةَ بْنِ عُمَيْرٍ الْهُذَلِيُّ",
              textAlign: TextAlign.end,
              softWrap: true,
              style: const TextStyle(
                color: appGreenDark,
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
          ),
          Text(
            " telah menceritakan kepada kami [Qutaibah bin Sa'id] berkata, telah menceritakan kepada kami [Abu Awanah] dari [Simak bin Harb], dan telah menceritakan kepada kami [Hannad] berkata, telah menceritakan kepada kami [Waki'] dari [Israil] dari [Simak] dari [Mush'ab bin Sa'd] dari [Ibnu Umar] dari Nabi Shallahu 'alaihi wa Sallam, beliau bersabda: \" Tidak akan diterima shalat yang dilakukan tanpa bersuci, dan tidak akan diterima sedekah yang berasal dari harta curian.\" Hannad menyebutkan dalam hadisnya, \"tidak suci.\" Abu Isa berkata; \"Hadis ini adalah yang paling shahih dan paling baik dalam bab ini.\" Dalam bab tersebut juga ada hadis dari Abu Al Malih dari Bapaknya dan Abu Hurairah dan Anas. Dan Abu Al Malih bin Usamah namanya adalah Amir, disebut juga Zaid bin Usamah bin Umair Al Hudzali.\"",
            textAlign: TextAlign.start,
            style: const TextStyle(
              height: 1.3,
              letterSpacing: 0.6,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(height: 12),
          Text(
            "Bab",
            style: TextStyle(
              color: appGreen,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 4),
          Text(
            "Musnad Sepuluh Sahabat Yang Dijamin Masuk Surga",
            style: TextStyle(
                color: appGreen, fontSize: 12, fontStyle: FontStyle.italic),
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.copy_rounded,
                      color: Colors.black54,
                    ),
                    Text(
                      "Salin",
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              GestureDetector(
                onTap: () {},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.share_rounded,
                      color: Colors.black54,
                    ),
                    Text(
                      "Bagikan",
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Divider(
            color: Colors.black54,
          ),
          SizedBox(height: 10),
          Container(
            width: mq.width,
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: appGreen,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Text(
              "Musnad Ahmad #1",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: appGreenLight),
            child: Text(
              " حَدَّثَنَا قُتَيْبَةُ بْنُ سَعِيدٍ حَدَّثَنَا أَبُو عَوَانَةَ عَنْ سِمَاكِ بْنِ حَرْبٍ ح و حَدَّثَنَا هَنَّادٌ حَدَّثَنَا وَكِيعٌ عَنْ إِسْرَائِيلَ عَنْ سِمَاكٍ عَنْ مُصْعَبِ بْنِ سَعْدٍ عَنْ ابْنِ عُمَرَ عَنْ النَّبِيِّ صَلَّى اللَّهُ عَلَيْهِ وَسَلَّمَ قَالَ لَا تُقْبَلُ صَلَاةٌ بِغَيْرِ طُهُورٍ وَلَا صَدَقَةٌ مِنْ غُلُولٍ قَالَ هَنَّادٌ فِي حَدِيثِهِ إِلَّا بِطُهُورٍ قَالَ أَبُو عِيسَى هَذَا الْحَدِيثُ أَصَحُّ شَيْءٍ فِي هَذَا الْبَابِ وَأَحْسَنُ وَفِي الْبَاب عَنْ أَبِي الْمَلِيحِ عَنْ أَبِيهِ وَأَبِي هُرَيْرَةَ وَأَنَسٍ وَأَبُو الْمَلِيحِ بْنُ أُسَامَةَ اسْمُهُ عَامِرٌ وَيُقَالُ زَيْدُ بْنُ أُسَامَةَ بْنِ عُمَيْرٍ الْهُذَلِيُّ",
              textAlign: TextAlign.end,
              softWrap: true,
              style: const TextStyle(
                color: appGreenDark,
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
          ),
          Text(
            " telah menceritakan kepada kami [Qutaibah bin Sa'id] berkata, telah menceritakan kepada kami [Abu Awanah] dari [Simak bin Harb], dan telah menceritakan kepada kami [Hannad] berkata, telah menceritakan kepada kami [Waki'] dari [Israil] dari [Simak] dari [Mush'ab bin Sa'd] dari [Ibnu Umar] dari Nabi Shallahu 'alaihi wa Sallam, beliau bersabda: \" Tidak akan diterima shalat yang dilakukan tanpa bersuci, dan tidak akan diterima sedekah yang berasal dari harta curian.\" Hannad menyebutkan dalam hadisnya, \"tidak suci.\" Abu Isa berkata; \"Hadis ini adalah yang paling shahih dan paling baik dalam bab ini.\" Dalam bab tersebut juga ada hadis dari Abu Al Malih dari Bapaknya dan Abu Hurairah dan Anas. Dan Abu Al Malih bin Usamah namanya adalah Amir, disebut juga Zaid bin Usamah bin Umair Al Hudzali.\"",
            textAlign: TextAlign.start,
            style: const TextStyle(
              height: 1.3,
              letterSpacing: 0.6,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(height: 12),
          Text(
            "Bab",
            style: TextStyle(
              color: appGreen,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 4),
          Text(
            "Musnad Sepuluh Sahabat Yang Dijamin Masuk Surga",
            style: TextStyle(
                color: appGreen, fontSize: 12, fontStyle: FontStyle.italic),
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.copy_rounded,
                      color: Colors.black54,
                    ),
                    Text(
                      "Salin",
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              GestureDetector(
                onTap: () {},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.share_rounded,
                      color: Colors.black54,
                    ),
                    Text(
                      "Bagikan",
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Divider(
            color: Colors.black54,
          ),
          SizedBox(height: 10),
          Container(
            width: mq.width,
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: appGreen,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Text(
              "Musnad Ahmad #1",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: appGreenLight),
            child: Text(
              " حَدَّثَنَا قُتَيْبَةُ بْنُ سَعِيدٍ حَدَّثَنَا أَبُو عَوَانَةَ عَنْ سِمَاكِ بْنِ حَرْبٍ ح و حَدَّثَنَا هَنَّادٌ حَدَّثَنَا وَكِيعٌ عَنْ إِسْرَائِيلَ عَنْ سِمَاكٍ عَنْ مُصْعَبِ بْنِ سَعْدٍ عَنْ ابْنِ عُمَرَ عَنْ النَّبِيِّ صَلَّى اللَّهُ عَلَيْهِ وَسَلَّمَ قَالَ لَا تُقْبَلُ صَلَاةٌ بِغَيْرِ طُهُورٍ وَلَا صَدَقَةٌ مِنْ غُلُولٍ قَالَ هَنَّادٌ فِي حَدِيثِهِ إِلَّا بِطُهُورٍ قَالَ أَبُو عِيسَى هَذَا الْحَدِيثُ أَصَحُّ شَيْءٍ فِي هَذَا الْبَابِ وَأَحْسَنُ وَفِي الْبَاب عَنْ أَبِي الْمَلِيحِ عَنْ أَبِيهِ وَأَبِي هُرَيْرَةَ وَأَنَسٍ وَأَبُو الْمَلِيحِ بْنُ أُسَامَةَ اسْمُهُ عَامِرٌ وَيُقَالُ زَيْدُ بْنُ أُسَامَةَ بْنِ عُمَيْرٍ الْهُذَلِيُّ",
              textAlign: TextAlign.end,
              softWrap: true,
              style: const TextStyle(
                color: appGreenDark,
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
          ),
          Text(
            " telah menceritakan kepada kami [Qutaibah bin Sa'id] berkata, telah menceritakan kepada kami [Abu Awanah] dari [Simak bin Harb], dan telah menceritakan kepada kami [Hannad] berkata, telah menceritakan kepada kami [Waki'] dari [Israil] dari [Simak] dari [Mush'ab bin Sa'd] dari [Ibnu Umar] dari Nabi Shallahu 'alaihi wa Sallam, beliau bersabda: \" Tidak akan diterima shalat yang dilakukan tanpa bersuci, dan tidak akan diterima sedekah yang berasal dari harta curian.\" Hannad menyebutkan dalam hadisnya, \"tidak suci.\" Abu Isa berkata; \"Hadis ini adalah yang paling shahih dan paling baik dalam bab ini.\" Dalam bab tersebut juga ada hadis dari Abu Al Malih dari Bapaknya dan Abu Hurairah dan Anas. Dan Abu Al Malih bin Usamah namanya adalah Amir, disebut juga Zaid bin Usamah bin Umair Al Hudzali.\"",
            textAlign: TextAlign.start,
            style: const TextStyle(
              height: 1.3,
              letterSpacing: 0.6,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(height: 12),
          Text(
            "Bab",
            style: TextStyle(
              color: appGreen,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 4),
          Text(
            "Musnad Sepuluh Sahabat Yang Dijamin Masuk Surga",
            style: TextStyle(
                color: appGreen, fontSize: 12, fontStyle: FontStyle.italic),
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.copy_rounded,
                      color: Colors.black54,
                    ),
                    Text(
                      "Salin",
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              GestureDetector(
                onTap: () {},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.share_rounded,
                      color: Colors.black54,
                    ),
                    Text(
                      "Bagikan",
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(color: Colors.black),
        ],
      ),
    );
  }
}
