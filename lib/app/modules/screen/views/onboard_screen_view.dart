import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quran_emufassir/app/constant/theme.dart';

import '../../../routes/app_pages.dart';

class OnboardScreenView extends GetView {
  const OnboardScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Qur'an E-Mufassir",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: appFontFamily,
                  color: appGreen),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Mudah Beribadah Dimana Saja!",
            ),
            SizedBox(
              height: mq.height * 0.05,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                width: 300,
                height: 300,
                child: Builder(builder: (context) {
                  if (kIsWeb) {
                    return Image.asset("assets/images/splash.png");
                  }
                  return Lottie.asset("assets/lotties/splashscreen.json");
                }),
              ),
            ),
            SizedBox(
              height: mq.height * 0.05,
            ),
            ElevatedButton(
              onPressed: () {
                Get.offAllNamed(Routes.DASHBOARD);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: const Text(
                "GET STARTED",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
