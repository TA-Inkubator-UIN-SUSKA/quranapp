import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';


import '../../../constant/theme.dart';
import '../../../routes/app_pages.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding:
              EdgeInsets.symmetric(horizontal: mq.width * 0.05, vertical: 16),
          children: [
            const Text(
              "Assalamualaikum",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Muslimin/Muslimat",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    appGreen.withOpacity(0.8),
                    appGreenDark,
                  ],
                ),
              ),
              width: Get.width,
              child: Stack(
                children: [
                  Positioned(
                    bottom: -20,
                    right: 10,
                    child: Opacity(
                      opacity: 0.8,
                      child: SizedBox(
                        height: 140,
                        width: 140,
                        child: Image.asset(
                          'assets/images/Quran.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ahad",
                          style: TextStyle(
                              color: appWhite, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "29 Muharram 1445",
                          style: TextStyle(
                              color: appWhite,
                              fontSize: 19,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "12 Januari 2024",
                          style: TextStyle(
                            color: appWhite.withOpacity(0.5),
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Sudah baca Qur'an hari ini?",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Material(
              borderRadius: BorderRadius.circular(20),
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        appGreen.withOpacity(0.8),
                        appGreenDark,
                      ],
                    ),
                  ),
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          margin: EdgeInsets.only(right: 10),
                          child: Image.asset(
                            'assets/images/Quran.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Terakhir baca",
                              style: TextStyle(
                                  color: appWhite.withOpacity(0.8),
                                  fontSize: 14),
                            ),
                            SizedBox(height: 2),
                            Text(
                              "Al-Fatihah : 1",
                              style: const TextStyle(
                                  color: appWhite,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Spacer(),
                        Icon(
                          CupertinoIcons.right_chevron,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            GridView(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.75),
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: mq.width * 0.01),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        appGreen.withOpacity(0.8),
                        appGreenDark,
                      ],
                    ),
                  ),
                  width: Get.width,
                  child: Padding(
                    padding: EdgeInsets.all(mq.width * 0.015),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Opacity(
                          opacity: 0.8,
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: Image.asset(
                              'assets/images/Quran.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Spacer(flex: 2),
                        Text(
                          "Chat Bot Quran",
                          style: TextStyle(
                            color: appWhite,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Go to >",
                          style: TextStyle(
                            color: appWhite,
                            fontSize: 12,
                          ),
                        ),
                        Spacer()
                      ],
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  margin: EdgeInsets.symmetric(horizontal: mq.width * 0.01),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        appGreen.withOpacity(0.8),
                        appGreenDark,
                      ],
                    ),
                  ),
                  width: Get.width,
                  height: mq.height * 0.2,
                )),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.symmetric(horizontal: mq.width * 0.01),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        appGreen.withOpacity(0.8),
                        appGreenDark,
                      ],
                    ),
                  ),
                  width: Get.width,
                  height: mq.height * 0.2,
                ))
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.HOME);
              },
              child: const Text("Quran"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.CHATBOT);
              },
              child: const Text("Chatbot"),
            ),
          ],
        ),
      ),
    );
  }
}
