import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/theme.dart';
import '../../../widgets/message_card.dart';
import '../controllers/chatbot_controller.dart';

class ChatbotView extends GetView<ChatbotController> {
  final String routesEndPoint = Get.arguments["routes_endpoint"];
  final String title = Get.arguments["title"];

  ChatbotView({super.key});

  @override
  Widget build(BuildContext context) {
    log(routesEndPoint);
    mq = MediaQuery.sizeOf(context);
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: appGreenDark),
          title: Text(
            "Chatbot $title",
            style: TextStyle(color: appGreenDark),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.history))],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.textC,
                  textAlign: TextAlign.center,
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  decoration: InputDecoration(
                    fillColor: Theme.of(context).scaffoldBackgroundColor,
                    filled: true,
                    isDense: true,
                    hintText: "Tuliskan pertanyaan anda disini ...",
                    hintStyle: const TextStyle(fontSize: 14),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              CircleAvatar(
                backgroundColor: appGreen,
                radius: 24,
                child: IconButton(
                  icon: const Icon(
                    Icons.rocket_launch_rounded,
                    color: Colors.white,
                    size: 28,
                  ),
                  onPressed: () {
                    controller.askQuestion(routesEndPoint);
                  },
                ),
              ),
            ],
          ),
        ),
        body: Obx(() => ListView(
            physics: const BouncingScrollPhysics(),
            // controller: _c.scrollC,
            padding: EdgeInsets.only(
              top: mq.height * 0.02,
              bottom: mq.height * 0.12,
            ),
            children:
                controller.list.map((e) => MessageCard(message: e)).toList())));
  }
}
