import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quran_emufassir/app/routes/app_pages.dart';

import '../../../constant/theme.dart';
import '../../../helper/custom_loading.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 3),
      () {
        Get.offNamed(Routes.ONBOARD_SCREEN);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            const Spacer(
              flex: 2,
            ),
            Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(mq.width * 0.05),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: mq.width * 0.4,
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              "E-Mufassir",
              style: TextStyle(
                fontFamily: appFontFamily,
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: appGreen,
              ),
            ),
            const Spacer(),
            const CustomLoading(),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
