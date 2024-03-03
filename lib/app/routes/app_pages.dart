// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:quran_emufassir/app/modules/chatbot/views/home_chatbot_view.dart';
import 'package:quran_emufassir/app/modules/hadits/bindings/hadits_binding.dart';
import 'package:quran_emufassir/app/modules/hadits/views/bab_hadits_view.dart';
import 'package:quran_emufassir/app/modules/hadits/views/hadits_view.dart';
import 'package:quran_emufassir/app/modules/hadits/views/home_hadits_view.dart';
import 'package:quran_emufassir/app/modules/screen/views/onboard_screen_view.dart';
import 'package:quran_emufassir/app/modules/screen/views/splash_screen_view.dart';

import '../modules/chatbot/bindings/chatbot_binding.dart';
import '../modules/chatbot/views/chatbot_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/detail_juz/bindings/detail_juz_binding.dart';
import '../modules/detail_juz/views/detail_juz_view.dart';
import '../modules/detail_surah/bindings/detail_surah_binding.dart';
import '../modules/detail_surah/views/detail_surah_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
    ),
    GetPage(
      name: _Paths.ONBOARD_SCREEN,
      page: () => const OnboardScreenView(),
    ),
    GetPage(
      name: _Paths.DETAIL_SURAH,
      page: () => DetailSurahView(),
      binding: DetailSurahBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_JUZ,
      page: () => DetailJuzView(),
      binding: DetailJuzBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.CHATBOT,
      page: () => ChatbotView(),
      binding: ChatbotBinding(),
    ),
    GetPage(
        name: _Paths.HOME_CHATBOT,
        page: () => const HomeChatbotView(),
        binding: ChatbotBinding()),
    GetPage(
        name: _Paths.HOME_HADITS,
        page: () => HomeHaditsView(),
        binding: HaditsBinding()),
    GetPage(
        name: _Paths.HADITS,
        page: () => HaditsView(),
        binding: HaditsBinding()),
    GetPage(
        name: _Paths.BAB_HADITS,
        page: () => BabHaditsView(),
        binding: HaditsBinding()),
  ];
}
