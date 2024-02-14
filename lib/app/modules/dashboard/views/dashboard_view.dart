import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quranapp/app/routes/app_pages.dart';

import '../../../constant/theme.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);

    return Scaffold(
      
      body: SafeArea(
        child: ListView(
          // padding: EdgeInsets.symmetric(horizontal: mq.width * 0.05),
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
                        height: 160,
                        width: 160,
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
                        const Row(
                          children: [
                            Icon(
                              Icons.menu_book_rounded,
                              color: appWhite,
                            ),
                            Text(
                              "  Last Read",
                              style: TextStyle(
                                color: appWhite,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          "Al-Fatihah",
                          style: TextStyle(
                            color: appWhite,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "Ayat 1",
                          style: TextStyle(
                            color: appWhite.withOpacity(0.5),
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          "Go to >",
                          style: TextStyle(
                            color: appWhite,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
