import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quran_emufassir/app/data/models/bookmark.dart';
import 'package:quran_emufassir/app/data/models/hijriah_date.dart';
import 'package:quran_emufassir/app/helper/custom_loading.dart';
import '../../../constant/theme.dart';
import '../../../routes/app_pages.dart';
import '../../settings/controllers/settings_controller.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  final settingC = Get.put(SettingsController(fromDashboard: true));

  DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: appBackground,
      body: SafeArea(
        child: GetBuilder<DashboardController>(
          builder: (controller) => FutureBuilder(
            future: Future.wait(
                [controller.getHijriahDate(), controller.getLastRead()]),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CustomLoading());
              }

              HijriahDate? objHijriahDate = snapshot.data?[0] as HijriahDate?;
              Bookmark? lastRead = (snapshot.data?[1]) as Bookmark?;

              return ListView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                    horizontal: mq.width * 0.05, vertical: 16),
                children: [
                  const Text(
                    "Assalamu'alaikum",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Muslimin/Muslimat",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          appGreen.withOpacity(0.8),
                          appGreenDark,
                        ],
                      ),
                    ),
                    width: Get.width,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: -20,
                          right: 10,
                          child: SizedBox(
                            height: 140,
                            width: 140,
                            child: Lottie.asset(
                              'assets/lotties/moslem.json',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${objHijriahDate?.hari}",
                                style: const TextStyle(
                                    color: appWhite,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                "${objHijriahDate?.tanggalHijriyah}${objHijriahDate?.bulanHijriyah}${objHijriahDate?.tahunHijriyah}",
                                style: const TextStyle(
                                    color: appWhite,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "${objHijriahDate?.tanggalMasehi} ${objHijriahDate?.bulanMasehi} ${objHijriahDate?.tahunMasehi}",
                                style: TextStyle(
                                  color: appWhite.withOpacity(0.5),
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 8),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Sudah baca Qur'an hari ini?",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Material(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        settingC.isWBW = false;
                        switch (lastRead?.via) {
                          // case "juz":
                          //   Map<String, dynamic> dataMapPerJuz =
                          //       controller.allJuz[lastRead["juz"] - 1];
                          //   Get.toNamed(Routes.DETAIL_JUZ, arguments: {
                          //     "juz": dataMapPerJuz,
                          //     "bookmark": lastRead,
                          //   });

                          //   break;
                          default:
                            Get.toNamed(Routes.DETAIL_SURAH, arguments: {
                              "name": lastRead?.surah
                                  .toString()
                                  .replaceAll("+", "'"),
                              "number": lastRead?.numberSurah,
                              "bookmark": lastRead,
                              "surah": lastRead?.surah
                            });
                        }
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            colors: [
                              appGreen.withOpacity(0.8),
                              appGreenDark,
                            ],
                          ),
                        ),
                        width: Get.width,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                margin: const EdgeInsets.only(right: 10),
                                child: Lottie.asset(
                                  'assets/lotties/bookmark.json',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Terakhir baca",
                                    style: TextStyle(
                                        color: appWhite.withOpacity(0.8),
                                        fontSize: 14),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    lastRead?.surah?.name == null
                                        ? ""
                                        : "${lastRead!.surah!.name.toString().replaceAll("+", "'")} : ${lastRead.ayat}",
                                    style: const TextStyle(
                                        color: appWhite,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              const Icon(
                                CupertinoIcons.right_chevron,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  GridView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.75),
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.HOME);
                        },
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: mq.width * 0.01),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              colors: [
                                appGreen.withOpacity(0.8),
                                appGreenDark,
                              ],
                            ),
                          ),
                          width: Get.width,
                          child: Padding(
                            padding: const EdgeInsets.all(14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Lottie.asset("assets/lotties/quran_read.json",
                                    width: mq.width * 0.4,
                                    height: mq.height * 0.2),
                                const Spacer(flex: 2),
                                const Text(
                                  "Baca Al-Qur'an",
                                  style: TextStyle(
                                      color: appWhite,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "Lihat selengkapnya >",
                                  style: TextStyle(
                                    color: appWhite.withOpacity(0.6),
                                    fontSize: 12,
                                  ),
                                ),
                                const Spacer()
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.HOME_CHATBOT);
                        },
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: mq.width * 0.01),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              colors: [
                                appGreen.withOpacity(0.8),
                                appGreenDark,
                              ],
                            ),
                          ),
                          width: Get.width,
                          child: Padding(
                            padding: const EdgeInsets.all(14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Lottie.asset("assets/lotties/chat.json",
                                    width: mq.width * 0.4,
                                    height: mq.height * 0.2),
                                const Spacer(flex: 2),
                                const Text(
                                  "Tanya Chatbot",
                                  style: TextStyle(
                                      color: appWhite,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Text(
                                      "Lihat selengkapnya >",
                                      style: TextStyle(
                                        color: appWhite.withOpacity(0.6),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer()
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Ingin membantu pengembangan aplikasi?",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Material(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        controller.launchDonationURL();
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            colors: [
                              appGreen.withOpacity(0.8),
                              appGreenDark,
                            ],
                          ),
                        ),
                        width: Get.width,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                margin: const EdgeInsets.only(right: 10),
                                child: Lottie.asset(
                                  'assets/lotties/donation.json',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Salurkan",
                                    style: TextStyle(
                                        color: appWhite.withOpacity(0.8),
                                        fontSize: 14),
                                  ),
                                  const SizedBox(height: 2),
                                  const Text(
                                    "Donasimu disini!",
                                    style: TextStyle(
                                        color: appWhite,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.open_in_new_rounded,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
