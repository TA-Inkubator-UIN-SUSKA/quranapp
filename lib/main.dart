// import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quran_emufassir/app/constant/theme.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  // For Development Certificate Issue
  // HttpOverrides.global = MyHttpOverrides();
  runApp(
    GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: appBackground,
      ),
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }
