import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_emufassir/app/helper/custom_loading.dart';
import 'package:quran_emufassir/app/helper/status.dart';
import 'package:quran_emufassir/app/modules/hadits/controllers/hadits_controller.dart';
import '../../../constant/theme.dart';

class SearchNumberHaditsView extends GetView<HaditsController> {
  const SearchNumberHaditsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: appGreenDark),
        title: const Text(
          "Search Hadits",
          style: TextStyle(color: appGreenDark),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          DropdownButtonFormField(
            isExpanded: true,
            value: controller.idSelectedKitab,
            hint: const Text("Pilih Kitab"),
            items: [
              for (int i = 0; i <= controller.listKitabs.length - 1; i++)
                DropdownMenuItem(
                  value: i + 1,
                  child: Text(
                      "${controller.listKitabs[i]["nama_kitab"] ?? "null"}"),
                ),
            ],
            onChanged: (value) {
              controller.idSelectedKitab = value!;
              log(controller.idSelectedKitab.toString());
            },
          ),
          const SizedBox(height: 12),
          TextField(
            controller: controller.textC,
            keyboardType: TextInputType.number,
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            decoration: InputDecoration(
              fillColor: Theme.of(context).scaffoldBackgroundColor,
              isDense: true,
              hintText: "Masukkan nomor hadits",
              hintStyle: const TextStyle(fontSize: 14),
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              controller.searchHadits();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: appGreen,
            ),
            child: const Text("Cari"),
          ),
          Obx(() {
            if (controller.status.value == Status.loading) {
              return const SizedBox(height: 100, child: CustomLoading());
            } else if (controller.status.value == Status.complete) {
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
                      "${controller.hadits?.kitab} #${controller.hadits?.id}",
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
                      "${controller.hadits?.arab}",
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
                    "${controller.hadits?.terjemah}",
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      height: 1.3,
                      letterSpacing: 0.6,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  if (controller.hadits?.idBab != null)
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
                          "${controller.hadits?.bab}",
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
              return const SizedBox();
            }
          })
        ],
      ),
    );
  }
}
