import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/hadits_controller.dart';

class HaditsView extends GetView<HaditsController> {
  const HaditsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HaditsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HaditsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
