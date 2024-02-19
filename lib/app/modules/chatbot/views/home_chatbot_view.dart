import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quran_emufassir/app/modules/chatbot/controllers/chatbot_controller.dart';
import 'package:quran_emufassir/app/routes/app_pages.dart';

import '../../../constant/theme.dart';

class HomeChatbotView extends GetView<ChatbotController> {
  const HomeChatbotView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: appGreenDark),
          title: const Text(
            'Chatbot',
            style: TextStyle(color: appGreenDark),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: mq.width * 0.05),
            children: [
              // Chatbot Al-Qur'an
              Material(
                borderRadius: BorderRadius.circular(20),
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Get.toNamed(Routes.CHATBOT, arguments: {
                      "routes_endpoint": "alquran-prompt",
                      "title": "Al_Qur'an",
                    });
                  },
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
                          Expanded(
                            flex: 1,
                            child: Image.asset(
                              'assets/images/Quran.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Chatbot Al-Qur'an",
                                    style: TextStyle(
                                        color: appWhite,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    "Sumber jawaban diambil dari\nAyat Al-Qur'an dan Terjemahan",
                                    style: TextStyle(
                                      color: appWhite.withOpacity(0.8),
                                      fontSize: 12,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          const Icon(
                            CupertinoIcons.right_chevron,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // Chatbot Al-Azhar
              Material(
                borderRadius: BorderRadius.circular(20),
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Get.toNamed(Routes.CHATBOT, arguments: {
                      "routes_endpoint": "al-azhar-prompt",
                      "title": "Al-Azhar",
                    });
                  },
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
                          Expanded(
                            flex: 1,
                            child: Image.asset(
                              'assets/images/Quran.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Chatbot Al-Azhar",
                                    style: TextStyle(
                                        color: appWhite,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    "Sumber jawaban diambil dari\nTafsir Al-Azhar",
                                    style: TextStyle(
                                      color: appWhite.withOpacity(0.8),
                                      fontSize: 12,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          const Icon(
                            CupertinoIcons.right_chevron,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // Chatbot Al-Jalalain
              Material(
                borderRadius: BorderRadius.circular(20),
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Get.toNamed(Routes.CHATBOT, arguments: {
                      "routes_endpoint": "al-jalalain",
                      "title": "Al-Jalalain",
                    });
                  },
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
                          Expanded(
                            flex: 1,
                            child: Image.asset(
                              'assets/images/Quran.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Chatbot Al-Jalalain",
                                    style: TextStyle(
                                        color: appWhite,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    "Sumber jawaban diambil dari\nTafsir Al-Jalalain",
                                    style: TextStyle(
                                      color: appWhite.withOpacity(0.8),
                                      fontSize: 12,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          const Icon(
                            CupertinoIcons.right_chevron,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // Chatbot Ibn Katsir
              Material(
                borderRadius: BorderRadius.circular(20),
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Get.toNamed(Routes.CHATBOT, arguments: {
                      "routes_endpoint": "ibn-kathir",
                      "title": "Ibnu Katsir",
                    });
                  },
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
                          Expanded(
                            flex: 1,
                            child: Image.asset(
                              'assets/images/Quran.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Chatbot Ibnu Katsir",
                                    style: TextStyle(
                                        color: appWhite,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    "Sumber jawaban diambil dari\nTafsir Ibnu Katsir",
                                    style: TextStyle(
                                      color: appWhite.withOpacity(0.8),
                                      fontSize: 12,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          const Icon(
                            CupertinoIcons.right_chevron,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
