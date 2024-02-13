import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../data/models/message.dart';

class ChatbotController extends GetxController {
  final textC = TextEditingController();
  final scrollC = ScrollController();

  final list = <Message>[
    Message(msg: "Hello, how can i help you?", msgType: MessageType.bot),
    Message(msg: "Laborum consequat magna non id irure velit consequat esse minim.?", msgType: MessageType.user)
  ].obs;

  Future<void> askQuestion() async {
    log(textC.text);
    try {
      if (textC.text.trim().isNotEmpty) {
        list.add(Message(msg: textC.text, msgType: MessageType.user));
        list.add(
            Message(msg: "Waiting for response!", msgType: MessageType.bot));

        final res = await http.post(
            Uri.parse("https://api-chat-quran.e-mufassir.com/al-azhar-prompt"),
            body: {
              "question": textC.text
            },
            headers: {
              HttpHeaders.contentTypeHeader:
                  'application/x-www-form-urlencoded',
            });
        list.removeLast();
        log(res.body);

        list.add(Message(
            msg: jsonDecode(res.body)["answer"], msgType: MessageType.bot));
        textC.text = '';
      } else {
        Get.snackbar("Info", "Tanyakan sesuatu",
            backgroundColor: Colors.blue.withOpacity(0.8),
            colorText: Colors.white);
        // MyDialog.info("Ask something!");
      }
    } catch (e) {
      log("$e");
    }
  }
}
