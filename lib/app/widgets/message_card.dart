import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranapp/app/data/models/message.dart';
import 'package:share_plus/share_plus.dart';
import '../constant/theme.dart';
import 'package:flutter/services.dart';

class MessageCard extends StatelessWidget {
  final Message message;
  const MessageCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return message.msgType == MessageType.bot
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(width: 6),
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 18,
                child: Image.asset(
                  'assets/images/muslim.png',
                  width: 30,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      log("message");
                      Get.dialog(Dialog(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              constraints:
                                  BoxConstraints(maxWidth: mq.width * 0.6),
                              margin: EdgeInsets.only(
                                left: mq.width * 0.02,
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: mq.height * 0.01,
                                horizontal: mq.width * 0.02,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: appGreen),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15))
                                        .copyWith(
                                  bottomLeft: const Radius.circular(0),
                                ),
                              ),
                              child: SelectableText(message.msg),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 12),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6))),
                              child: Column(
                                children: [
                                  SimpleDialogOption(
                                    onPressed: () {
                                      Clipboard.setData(
                                        ClipboardData(
                                            text:
                                                "Question : ${message.question}\nAnswer : ${message.answer}"),
                                      );
                                      Get.snackbar('Copied!',
                                          'Text copied to clipboard.',
                                          snackPosition: SnackPosition.BOTTOM);
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.copy),
                                        Text("Copy")
                                      ],
                                    ),
                                  ),
                                  SimpleDialogOption(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.share),
                                        Text("Share")
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ));
                    },
                    child: Container(
                      constraints: BoxConstraints(maxWidth: mq.width * 0.6),
                      margin: EdgeInsets.only(
                        left: mq.width * 0.02,
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: mq.height * 0.01,
                        horizontal: mq.width * 0.02,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: appGreen),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15))
                                .copyWith(
                          bottomLeft: const Radius.circular(0),
                        ),
                      ),
                      child: Text(message.msg),
                    ),
                  ),
                  if (message.answer != '')
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Clipboard.setData(
                                ClipboardData(
                                    text:
                                        "Question : ${message.question}\nAnswer : ${message.answer}"),
                              );
                              Get.snackbar(
                                  'Copied!', 'Text copied to clipboard.',
                                  snackPosition: SnackPosition.BOTTOM);
                            },
                            child: const Icon(
                              Icons.copy,
                              size: 14,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Share.share(
                                  "Question : ${message.question}\nAnswer : ${message.answer}");
                            },
                            child: const Icon(
                              Icons.share,
                              size: 14,
                            ),
                          )
                        ],
                      ),
                    )
                ],
              ),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: mq.width * 0.6),
                margin: EdgeInsets.only(
                  bottom: mq.height * 0.02,
                  left: mq.width * 0.02,
                  top: mq.height * 0.02,
                ),
                padding: EdgeInsets.symmetric(
                  vertical: mq.height * 0.01,
                  horizontal: mq.width * 0.02,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: appGreen),
                  borderRadius:
                      const BorderRadius.all(Radius.circular(15)).copyWith(
                    bottomRight: const Radius.circular(0),
                  ),
                ),
                child: Text(message.msg),
              ),
              const CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 18,
                child: Icon(
                  Icons.person,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(width: 6),
            ],
          );
  }
}
