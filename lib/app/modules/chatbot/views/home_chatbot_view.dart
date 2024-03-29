import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_emufassir/app/data/models/chatbot.dart';
import 'package:quran_emufassir/app/helper/data_chatbots.dart';
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
        child: Scrollbar(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: mq.width * 0.05),
            itemCount: listChatbot.length,
            itemBuilder: (context, index) {
              Chatbot chatbot = listChatbot[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: InkWell(
                  onTap: () {
                    Get.toNamed(Routes.CHATBOT, arguments: {
                      "routes_endpoint": chatbot.endpoint,
                      "title": chatbot.appBar,
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
                              chatbot.image,
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
                                  Text(
                                    chatbot.title,
                                    style: const TextStyle(
                                        color: appWhite,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    chatbot.desc,
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
              );
            },
          ),
        ),
      ),
    );
  }
}
