import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../data/models/message.dart';
import '../../../helper/my_dialogs.dart';

class ChatbotController extends GetxController {
  final textC = TextEditingController();
  final scrollC = ScrollController();

  final list = <Message>[
    Message(
      msg: "Assalamu'alaikum, ada yang bisa saya bantu?",
      answer: "",
      question: "Assalamu'alaikum, ada yang bisa saya bantu?",
      msgType: MessageType.bot,
    ),
  ].obs;

  Future<void> askQuestion(String endpoint) async {
    log(textC.text);
    try {
      if (textC.text.trim().isNotEmpty) {
        list.add(Message(
            msg: textC.text,
            question: textC.text,
            answer: "",
            msgType: MessageType.user));

        MyDialog.showLoadingDialog();

        final res = await http.post(Uri.parse(endpoint), body: {
          "question": textC.text
        }, headers: {
          HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
        });

        list.add(
          Message(
              msg: jsonDecode(res.body)["answer"],
              msgType: MessageType.bot,
              answer: jsonDecode(res.body)["answer"],
              question: textC.text),
        );
        Get.back();
        textC.text = '';
        textC.clear();
      } else {
        MyDialog.info("Tanyakan sesuatu!");
      }
    } catch (e) {
      log("$e");
    }
  }
}
