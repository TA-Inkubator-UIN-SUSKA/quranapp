import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/theme.dart';
import '../detail_surah/controllers/detail_surah_controller.dart';

class DetailSurahView extends GetView<DetailSurahController> {
  final int idSurah = Get.arguments;

  DetailSurahView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: appGreenDark),
          title: Text(
            '$idSurah. Al -Fatihah',
            style: const TextStyle(
              color: appGreenDark,
            ),
          ),
          backgroundColor: appWhite,
          elevation: 0,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
                color: appGreenDark,
              ),
            )
          ],
        ),
        body: FutureBuilder(
          builder: (context, snapshot) {
            return ListView(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: 7,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: Get.width,
                            padding: const EdgeInsets.all(30),
                            decoration: BoxDecoration(
                              color: appGreenLight,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: appGreenDark, width: 2),
                            ),
                            child: const Text(
                              "بِسْمِ ٱللَّهِ ٱلرَّحْمَـٰنِ ٱلرَّحِيمِ",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 24,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${index + 1}. lorem lorem lorem",
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${index + 1}. Lorem ipsum dolor sit amet.",
                            style: const TextStyle(),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            );
          },
          future: null,
        ));
  }
}
