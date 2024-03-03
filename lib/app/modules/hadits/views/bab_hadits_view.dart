import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/hadits_controller.dart';

class BabHaditsView extends GetView<HaditsController> {
  const BabHaditsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BabHaditsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BabHaditsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
