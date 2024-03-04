import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quran_emufassir/app/constant/const.dart';
import 'package:quran_emufassir/app/helper/my_dialogs.dart';
import 'package:share_plus/share_plus.dart';
import '../../../constant/theme.dart';
import '../../../data/models/kitab.dart';
import '../../../helper/custom_loading.dart';
import '../../../routes/app_pages.dart';
import '../controllers/hadits_controller.dart';

class HaditsView extends GetView<HaditsController> {
  final int idKitab = Get.arguments["id"];
  final String namaKitab = Get.arguments["nama_kitab"];

  HaditsView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.clearData();
    if (controller.isHaveBab) {
      controller.getMoreHaditsBabKitab(idKitab, controller.idBab!);
    } else {
      controller.getMoreHaditsKitab(idKitab);
    }

    final ScrollController scrollController = ScrollController();

    Future onRefresh() async {
      if (controller.isHaveBab) {
        controller.refreshDataBab(idKitab, controller.idBab!);
      } else {
        controller.refreshData(idKitab);
      }
    }

    void onScroll() {
      double maxScroll = scrollController.position.maxScrollExtent;
      double currentScroll = scrollController.position.pixels;

      if (maxScroll == currentScroll && controller.hasMore.value) {
        if (controller.isHaveBab) {
          controller.getMoreHaditsBabKitab(idKitab, controller.idBab!);
        } else {
          controller.getMoreHaditsKitab(idKitab);
        }
      }
    }

    log("$idKitab. $namaKitab + idBab ${controller.idBab} + isHavebab ${controller.isHaveBab}");
    scrollController.addListener(onScroll);

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: appGreenDark),
        title: Text(
          namaKitab,
          style: const TextStyle(
            color: appGreenDark,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed(Routes.SEARCH_HADITS, arguments: {
                  "id": idKitab,
                  "nama_kitab": namaKitab,
                });
              },
              icon: const Icon(CupertinoIcons.search))
        ],
      ),
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: Obx(
          () => ListView.builder(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
            itemCount: controller.hasMore.value
                ? controller.listHadits.length + 1
                : controller.listHadits.length,
            itemBuilder: (context, index) {
              if (index < controller.listHadits.length) {
                Data hadits = controller.listHadits[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: mq.width,
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: appGreen,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Text(
                        "$namaKitab #${hadits.id}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          color: appGreenLight),
                      child: Text(
                        hadits.arab!,
                        textAlign: TextAlign.end,
                        softWrap: true,
                        style: const TextStyle(
                          color: appGreenDark,
                          fontWeight: FontWeight.w500,
                          fontSize: 22,
                        ),
                      ),
                    ),
                    Text(
                      hadits.terjemah!,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        height: 1.3,
                        letterSpacing: 0.6,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    if (controller.isHaveBab)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 12),
                          const Text(
                            "Bab",
                            style: TextStyle(
                              color: appGreen,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "${hadits.bab}",
                            style: const TextStyle(
                                color: appGreen,
                                fontSize: 12,
                                fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.isHaveBab
                                ? Clipboard.setData(
                                    ClipboardData(
                                      text:
                                          "${hadits.arab}\n${hadits.terjemah}\nSumber : (Kitab ${hadits.kitab} : ${hadits.id} - Bab ${hadits.bab})\n\n$copyright",
                                    ),
                                  )
                                : Clipboard.setData(
                                    ClipboardData(
                                      text:
                                          "${hadits.arab}\n${hadits.terjemah}\nSumber : (${hadits.kitab} : ${hadits.id})\n\n$copyright",
                                    ),
                                  );
                            MyDialog.basicSnackbar(
                              title: "Berhasil",
                              msg: "Teks berhasil di salin!",
                            );
                          },
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.copy_rounded,
                                color: Colors.black54,
                              ),
                              Text(
                                "Salin",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            controller.isHaveBab
                                ? Share.share(
                                    "${hadits.arab}\n${hadits.terjemah}\nSumber : (Kitab ${hadits.kitab} : ${hadits.id} - Bab ${hadits.bab})\n\n$copyright",
                                  )
                                : Share.share(
                                    "${hadits.arab}\n${hadits.terjemah}\nSumber : (${hadits.kitab} : ${hadits.id})\n\n$copyright",
                                  );
                          },
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.share_rounded,
                                color: Colors.black54,
                              ),
                              Text(
                                "Bagikan",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Divider(
                      color: Colors.black54,
                    ),
                    const SizedBox(height: 10),
                  ],
                );
              } else {
                return const Padding(
                  padding: EdgeInsets.all(15),
                  child: Center(child: CustomLoading()),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
