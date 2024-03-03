import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constant/theme.dart';
import '../../../data/models/kitab.dart';
import '../../../helper/custom_loading.dart';
import '../controllers/hadits_controller.dart';

class SearchHaditsView extends GetView<HaditsController> {
  final search = ''.obs;
  final int idKitab = Get.arguments["id"];
  final String namaKitab = Get.arguments["nama_kitab"];

  SearchHaditsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.getMoreQueryHadits(idKitab, search.value);

    final ScrollController scrollController = ScrollController();

    Future onRefresh() async {
      controller.clearData();
      controller.getMoreQueryHadits(idKitab, search.value);
    }

    void onScroll() {
      double maxScroll = scrollController.position.maxScrollExtent;
      double currentScroll = scrollController.position.pixels;

      if (maxScroll == currentScroll && controller.hasMore.value) {
        controller.getMoreQueryHadits(idKitab, search.value);
      }
    }

    log("$idKitab. $namaKitab + idBab ${controller.idBab} + isHavebab ${controller.isHaveBab}");
    scrollController.addListener(onScroll);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: appGreenDark),
        title: Text(
          "Search $namaKitab",
          style: const TextStyle(color: appGreenDark),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: Column(
          children: [
            Container(
              width: mq.width * 0.9,
              margin: const EdgeInsets.only(bottom: 10),
              child: TextFormField(
                onChanged: (s) {
                  search.value = s.toLowerCase();
                },
                maxLines: null,
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
                decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: appGreen,
                      child: IconButton(
                        highlightColor: Colors.transparent,
                        padding: EdgeInsets.zero,
                        hoverColor: Colors.transparent,
                        icon: Icon(CupertinoIcons.search),
                        onPressed: () {
                          onRefresh();
                        },
                      ),
                    ),
                  ),
                  hintText: "Cari Nama Kitab...",
                  hintStyle: const TextStyle(
                    fontSize: 12,
                  ),
                  fillColor: Colors.white.withOpacity(0.8),
                  filled: true,
                  isDense: true,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Obx(
                () {
                  return ListView.builder(
                    controller: scrollController,
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
                                  onTap: () {},
                                  child: const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
