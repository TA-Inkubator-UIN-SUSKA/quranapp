import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/theme.dart';
import '../../../data/models/kitab.dart';
import '../../../helper/custom_loading.dart';
import '../controllers/hadits_controller.dart';

class HaditsView extends GetView<HaditsController> {
  final int idKitab = Get.arguments["id"];
  final String namaKitab = Get.arguments["nama_kitab"];

  HaditsView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.clearData();
    controller.getMoreHaditsBabKitab(idKitab, controller.idBab!);

    final ScrollController scrollController = ScrollController();

    Future onRefresh() async {
      controller.refreshData(idKitab, controller.idBab!);
    }

    void onScroll() {
      double maxScroll = scrollController.position.maxScrollExtent;
      double currentScroll = scrollController.position.pixels;

      if (maxScroll == currentScroll && controller.hasMore.value) {
        controller.getMoreHaditsBabKitab(idKitab, controller.idBab!);
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
      ),
      body: Builder(builder: (context) {
        if (controller.isHaveBab) {
          // Future Bab
          return RefreshIndicator(
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
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {},
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
                              onTap: () {},
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
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          );
        } else {
          // Future Without Bab
          return const Center(
            child: Text("Dari Bab"),
          );
        }
      }),
    );
  }
}
