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
      msg: "Hello, how can i help you?",
      answer: "",
      question: "Hello, how can i help you?",
      msgType: MessageType.bot,
    ),
    Message(
        msg:
            "Laborum consequat magna non id irure velit consequat esse minim.?",
        answer: "",
        question:
            "Laborum consequat magna non id irure velit consequat esse minim.?",
        msgType: MessageType.user),
    Message(
      msg:
          "Ut consectetur et commodo excepteur ut officia excepteur. Nostrud adipisicing deserunt pariatur non. Voluptate dolore nulla ex duis ex et elit reprehenderit. Excepteur ut ad fugiat incididunt labore et ex excepteur esse nulla qui tempor. Nostrud ex anim et dolore irure magna ex cupidatat sit Lorem.?",
      answer:
          "Ut consectetur et commodo excepteur ut officia excepteur. Nostrud adipisicing deserunt pariatur non. Voluptate dolore nulla ex duis ex et elit reprehenderit. Excepteur ut ad fugiat incididunt labore et ex excepteur esse nulla qui tempor. Nostrud ex anim et dolore irure magna ex cupidatat sit Lorem.?",
      question:
          "Laborum consequat magna non id irure velit consequat esse minim.?",
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
        list.add(Message(
            msg: "Waiting for response!",
            msgType: MessageType.bot,
            answer: '',
            question: textC.text));

        final res = await http.post(
            Uri.parse("https://api-chat-quran.e-mufassir.com/$endpoint"),
            body: {
              "question": textC.text
            },
            headers: {
              HttpHeaders.contentTypeHeader:
                  'application/x-www-form-urlencoded',
            });
        list.removeLast();
        log(res.body);

        list.add(
          Message(
              msg: jsonDecode(res.body)["answer"],
              msgType: MessageType.bot,
              answer: jsonDecode(res.body)["answer"],
              question: textC.text),
        );
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
