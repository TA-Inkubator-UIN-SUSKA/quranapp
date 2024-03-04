
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quran_emufassir/app/routes/app_pages.dart';

import '../../../constant/theme.dart';
import '../../../data/models/kitab.dart';
import '../controllers/hadits_controller.dart';

class BabHaditsView extends GetView<HaditsController> {
  final Kitab kitab = Get.arguments["kitab"];
  final search = ''.obs;

  BabHaditsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: appGreenDark),
        title: Text(
          "${kitab.namaKitab}",
          style: const TextStyle(color: appGreenDark),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed(Routes.SEARCH_HADITS, arguments: {
                  "id": kitab.id,
                  "nama_kitab": kitab.namaKitab,
                });
              },
              icon: const Icon(CupertinoIcons.search))
        ],
      ),
      body: Column(
        children: [
          Container(
            width: mq.width * 0.9,
            margin: const EdgeInsets.only(bottom: 10),
            child: TextFormField(
              onChanged: (s) => search.value = s.toLowerCase(),
              maxLines: null,
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              decoration: InputDecoration(
                suffixIcon: const Icon(CupertinoIcons.search),
                hintText: "Cari Bab...",
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
                List<Bab> listBabs = search.isEmpty
                    ? controller.listBab
                    : controller.listBab
                        .where((element) => element.namaBab
                            .toString()
                            .toLowerCase()
                            .contains(search.value))
                        .toList();
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: mq.width * 0.05),
                  itemCount: listBabs.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: InkWell(
                        onTap: () {
                          controller.idBab = listBabs[index].id!;
                          Get.toNamed(Routes.HADITS, arguments: {
                            "id": kitab.id,
                            "nama_kitab": kitab.namaKitab,
                          });
                        },
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              colors: [
                                appGreen2,
                                appGreen2.withOpacity(0.1),
                              ],
                            ),
                          ),
                          width: Get.width,
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Image.asset(
                                    "assets/images/hadits1.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          listBabs[index].namaBab ?? "null",
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(height: 2),
                                      ],
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                const Icon(
                                  CupertinoIcons.right_chevron,
                                  color: Colors.black,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
