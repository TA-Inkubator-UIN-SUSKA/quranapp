import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_emufassir/app/constant/const.dart';
import 'package:quran_emufassir/app/helper/my_dialogs.dart';
import 'package:share_plus/share_plus.dart';
import '../constant/theme.dart';
import 'package:flutter/services.dart';

import '../data/models/message.dart';

class MessageCard extends StatelessWidget {
  final Message message;
  final String chatbot;
  const MessageCard({super.key, required this.message, required this.chatbot});

  @override
  Widget build(BuildContext context) {
    return message.msgType == MessageType.bot ? botAnswer() : userQuestion();
  }

  Row userQuestion() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                Get.dialog(
                  Dialog(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          constraints: BoxConstraints(maxWidth: mq.width * 0.6),
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
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15),
                            ).copyWith(
                              bottomRight: const Radius.circular(0),
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
                                          "[Chatbot $chatbot by E-Mufassir]\nPertanyaan : ${message.question}\nJawaban : ${message.answer}\n\n$copyright",
                                    ),
                                  );
                                  MyDialog.basicSnackbar(
                                      msg: "Berhasil",
                                      title: "Teks berhasil disalin!");
                                },
                                child: GestureDetector(
                                  onTap: () {
                                    Clipboard.setData(
                                      ClipboardData(
                                        text:
                                            "[Chatbot $chatbot by E-Mufassir]\nPertanyaan : ${message.question}\nJawaban : ${message.answer}\n\n$copyright",
                                      ),
                                    );
                                    MyDialog.basicSnackbar(
                                        msg: "Berhasil",
                                        title: "Teks berhasil disalin!");
                                  },
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [Icon(Icons.copy), Text("Copy")],
                                  ),
                                ),
                              ),
                              const SimpleDialogOption(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [Icon(Icons.share), Text("Share")],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              child: Container(
                constraints: BoxConstraints(maxWidth: mq.width * 0.6),
                margin: EdgeInsets.only(
                  left: mq.width * 0.02,
                  top: 12,
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
            ),
            Container(
              margin: const EdgeInsets.only(top: 4, bottom: 12),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Clipboard.setData(
                        ClipboardData(
                            text:
                                "\nPertanyaan : ${message.question}\nJawaban : ${message.answer}"),
                      );
                      Get.snackbar('Copied!', 'Text copied to clipboard.',
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
            ),
          ],
        ),
        const CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 18,
          child: Icon(
            Icons.person,
            color: appGreen,
          ),
        ),
        const SizedBox(width: 6),
      ],
    );
  }

  Row botAnswer() {
    return Row(
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
                Get.dialog(
                  Dialog(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          constraints: BoxConstraints(maxWidth: mq.width * 0.6),
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
                                          "[Chatbot $chatbot by E-Mufassir]\nPertanyaan : ${message.question}\nJawaban : ${message.answer}\n\n$copyright",
                                    ),
                                  );
                                  MyDialog.basicSnackbar(
                                      msg: "Berhasil",
                                      title: "Teks berhasil disalin!");
                                },
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [Icon(Icons.copy), Text("Copy")],
                                ),
                              ),
                              SimpleDialogOption(
                                child: GestureDetector(
                                  onTap: () {
                                    Share.share(
                                      "[Chatbot $chatbot by E-Mufassir]\nPertanyaan : ${message.question}\nJawaban : ${message.answer}\n\n$copyright",
                                    );
                                  },
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.share),
                                      Text("Share")
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
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
                      const BorderRadius.all(Radius.circular(15)).copyWith(
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
                                "[Chatbot $chatbot by E-Mufassir]\nPertanyaan : ${message.question}\nJawaban : ${message.answer}\n\n$copyright",
                          ),
                        );
                        MyDialog.basicSnackbar(
                            msg: "Berhasil", title: "Teks berhasil disalin!");
                      },
                      child: const Icon(
                        Icons.copy,
                        size: 14,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Share.share(
                          "[Chatbot $chatbot by E-Mufassir]\nPertanyaan : ${message.question}\nJawaban : ${message.answer}\n\n$copyright",
                        );
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
    );
  }
}
