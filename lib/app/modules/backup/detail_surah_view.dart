import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quranapp/app/constant/theme.dart';
import 'package:quranapp/app/modules/detail_surah/controllers/detail_surah_controller.dart';

class DetailSurahView extends GetView<DetailSurahController> {
  int idSurah = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: appGreenDark),
          title: Text(
            '${idSurah}. Al -Fatihah',
            style: TextStyle(
              color: appGreenDark,
            ),
          ),
          backgroundColor: appWhite,
          elevation: 0,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
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
                  physics: ClampingScrollPhysics(),
                  itemCount: 7,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: Get.width,
                            padding: EdgeInsets.all(30),
                            decoration: BoxDecoration(
                              color: appGreenLight,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: appGreenDark, width: 2),
                            ),
                            child: Text(
                              "بِسْمِ ٱللَّهِ ٱلرَّحْمَـٰنِ ٱلرَّحِيمِ",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 24,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${index + 1}. lorem lorem lorem",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${index + 1}. Lorem ipsum dolor sit amet.",
                            style: TextStyle(),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ));
  }
}
