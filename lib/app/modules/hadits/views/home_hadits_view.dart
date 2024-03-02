import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constant/theme.dart';
import '../../../helper/custom_loading.dart';
import '../controllers/hadits_controller.dart';

class HomeHaditsView extends GetView<HaditsController> {
  const HomeHaditsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appGreen,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: appWhite),
        title: const Text(
          'Hadits',
          style: TextStyle(color: appWhite),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: controller.getKitabs(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CustomLoading());
            }
            List<Map<String, dynamic>> listKitabs =
                snapshot.data as List<Map<String, dynamic>>;

            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: mq.width * 0.05),
              itemCount: listKitabs.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: InkWell(
                    onTap: () {},
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
                        // color: appGreen2,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      listKitabs[index]["nama_kitab"] ?? "null",
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
    );
  }
}
